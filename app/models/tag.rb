class Tag < ActiveRecord::Base
	has_and_belongs_to_many :links
	has_many :note_tags
	has_many :notes, through: :note_tags
end
