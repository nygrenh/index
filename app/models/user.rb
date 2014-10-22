class User < ActiveRecord::Base
  include Timestamped

  has_secure_password
  has_many :links, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :domains, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
