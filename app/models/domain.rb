class Domain < ActiveRecord::Base
  include Timestamped
  has_many :links
  belongs_to :user

  validates :domain, presence: true

  def self.get(name, user_id)
    domain = Domain.where('lower(domain) = ?', name.downcase).find_by(user_id: user_id)
    domain ||= Domain.create domain: name, user_id: user_id
    domain
  end
end
