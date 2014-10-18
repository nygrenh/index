class Link < ActiveRecord::Base
  include PgSearch
  include Timestamped

  attr_accessor :tagstring
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

  has_many :link_tags
  has_many :tags, through: :link_tags
  belongs_to :user
  belongs_to :domain
  validates_presence_of :url
  validates :url, format: /\Ahttp.*\..*\z/

  before_validation :complete_url
  before_save :check_title
  before_save :associate_with_domain
  before_save :update_tags
  after_destroy :clean_domains
  before_destroy :clean_tags

  private

  def check_title
    self.title = url if title.blank?
  end

  def clean_domains
    domain.destroy if domain.links.count.zero?
    domain.link_count -= 1 unless domain.destroyed?
  end

  def associate_with_domain
    domain_s = URI.parse(url).host.gsub(/^www\./, '')
    domain = Domain.get(domain_s, user_id)
    self.domain = domain
    domain.link_count += 1
    domain.save
  end

  def update_tags
    return if tagstring.nil?
    old_tags = tags
    new_tags = []
    tagstring.split(', ').each do |t|
      new_tags << Tag.get(t, user_id)
    end
    self.tags = []
    self.tags = new_tags
    update_tag_link_counts(old_tags)
    update_tag_link_counts(new_tags)
  end

  def update_tag_link_counts(tags)
    tags.each(&:update_link_count)
  end

  def clean_tags
    tags.each do |t|
      tag = Tag.get(t.name, user_id)
      tag.link_count -= 1
      tag.save
    end
  end

  def complete_url
    self.url = 'http://' + url unless url.nil? || url.starts_with?('http://', 'https://')
  end
end
