class Tag < ActiveRecord::Base
  include Timestamped
  COLORS = %w(default blue light_blue cyan green light_green yellow red pink orange purple brown)

  has_many :link_tags
  has_many :links, through: :link_tags
  has_many :note_tags
  has_many :notes, through: :note_tags

  belongs_to :user

  validates_presence_of :name
  validates :tag_type, inclusion: { in: COLORS, message: '%{value} is not a valid color' }

  def self.get(name, user_id)
    tag = Tag.where('lower(name) = ?', name.downcase).find_by(user_id: user_id)
    tag ||= Tag.create name: name, tag_type: 'default', user_id: user_id
    tag
  end

  def self.colors
    COLORS.to_set
  end

  def update_link_count
    self.link_count = links.count
    save
  end

  def self.allowed_color?(color)
    colors.include?(color)
  end

end
