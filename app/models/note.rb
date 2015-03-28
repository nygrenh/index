class Note < ActiveRecord::Base
  include Timestamped

  has_many :note_tags
  has_many :tags, through: :note_tags
  belongs_to :user

  validates :text, presence: true
end
