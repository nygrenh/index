class Link < ActiveRecord::Base
  include PgSearch
  include Timestamped

  attr_accessor :tagstring

  pg_search_scope :search,
                  against: [:title, :url, :description],
                  associated_against: {
                    tags: :name
                  },
                  using: {
                    tsearch: {
                      dictionary: 'english',
                      any_word: true
                    },
                    dmetaphone: {
                      any_word: true,
                      only: [:title, :url, :name]
                    }
                  },
                  ranked_by: ':tsearch + (0.5 * :dmetaphone)'

  has_many :link_tags, dependent: :destroy
  has_many :tags, through: :link_tags
  belongs_to :user
  belongs_to :domain, counter_cache: true
  validates :url, format: /\Ahttp.*\..*\z/, presence: true

  before_validation :complete_url, :fill_title
  before_save :associate_with_domain
  after_save :update_tags
  after_destroy :clean_domains

  def current_tags
    tags.map(&:name).to_sentence(last_word_connector: ', ', two_words_connector: ', ')
  end

  protected

  def clean_domains
    domain.destroy if domain.links.count.zero?
  end

  def associate_with_domain
    domain_s = URI.parse(url).host.gsub(/^www\./, '')
    self.domain = Domain.get(domain_s, user_id)
  end

  def update_tags
    return unless @tagstring
    self.tags = given_tags.each_with_object([]) do |name, array|
      array << Tag.get(name.strip, user_id)
    end
  end

  def given_tags
    @tagstring.squish.split(', ')
  end

  def fill_title
    self.title = url if title.blank?
  end

  def complete_url
    self.url = 'http://' + url unless url.nil? || url.starts_with?('http://', 'https://')
  end
end
