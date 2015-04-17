class Note < ActiveRecord::Base
  include Timestamped

  has_many :taggables, as: :tagged
  has_many :tags, through: :taggables
  belongs_to :user

  validates :text, presence: true
end
