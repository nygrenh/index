class Tag < ActiveRecord::Base
  include Timestamped

  has_many :link_tags
  has_many :links, through: :link_tags
  has_many :note_tags
  has_many :notes, through: :note_tags

  belongs_to :user

  validates_presence_of :name
  validates :tag_type, inclusion: { in: Color.colors, message: '%{value} is not a valid color' }

  def self.get(name, user_id)
    tag = Tag.where('lower(name) = ?', name.downcase).find_by(user_id: user_id)
    tag ||= Tag.create name: name, tag_type: Color.random_color, user_id: user_id
    tag
  end

  def update_link_count
    self.link_count = links.count
    save
  end

end
