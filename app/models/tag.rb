class Tag < ActiveRecord::Base
	has_many :link_tags
	has_many :links, through: :link_tags
	has_many :note_tags
	has_many :notes, through: :note_tags
end
