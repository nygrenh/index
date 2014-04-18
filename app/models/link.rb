class Link < ActiveRecord::Base
	validates_presence_of :url
	has_many :link_tags
	has_many :tags, through: :link_tags
	belongs_to :domain, dependent: :destroy
end
