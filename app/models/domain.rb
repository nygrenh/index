class Domain < ActiveRecord::Base
  has_many :links
  belongs_to :user

  validates_presence_of :domain
end
