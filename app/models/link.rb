class Link < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  include PgSearch

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
  has_many :tags, through: :link_tags, dependent: :destroy
  belongs_to :user
  belongs_to :domain
  validates_presence_of :url
  validates :url, format: /\Ahttp.*\..*\z/

  before_save :check_title
  before_save :associate_with_domain
  after_destroy :clean_domains

  def timestamp
    diff = Time.now.to_i - created_at.to_i
    return created_at.strftime('%B %-d %Y') if diff >= 1.year
    return created_at.strftime('%B %-d') if diff >= 1.day
    return time_s(diff, 1.hour, 'hour') if diff >= 1.hour
    return time_s(diff, 1.minute, 'minute') if diff >= 1.minute
    'just now'
  end

  private

  def time_s(diff, divisor, word)
    pluralize(diff / divisor, word) + ' ago'
  end

  def check_title
    self.title = url if title.blank?
  end

  def clean_domains
    domain.destroy if domain && domain.links.count.zero?
  end

  def associate_with_domain
    domain_s = URI.parse(url).host.gsub(/^www\./, '')
    domain = Domain.find_by domain: domain_s, user_id: user_id
    domain = Domain.create domain: domain_s, user_id: user_id if domain.nil?
    self.domain = domain
    domain.link_count += 1
    domain.save
  end
end
