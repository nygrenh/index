class Link < ActiveRecord::Base
	validates_presence_of :url

	has_and_belongs_to_many :tags
	belongs_to :domain
end
