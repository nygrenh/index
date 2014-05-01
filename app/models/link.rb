class Link < ActiveRecord::Base
	has_many :link_tags
	has_many :tags, through: :link_tags, dependent: :destroy
	belongs_to :user
	belongs_to :domain, dependent: :destroy	
	validates_presence_of :url
	validates :url, format: /http.*\..*/
end
