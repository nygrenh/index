class User < ActiveRecord::Base
	has_secure_password
	has_many :links, dependent: :destroy

	validates_uniqueness_of :name
end
