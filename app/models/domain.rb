class Domain < ActiveRecord::Base
  has_many :links
  belongs_to :user
end
