class Domain < ActiveRecord::Base
  include Timestamped
  extend Gettable

  has_many :links
  belongs_to :user

  validates :name, presence: true
end
