class Tag < ActiveRecord::Base
  include Timestamped
  has_many :link_tags
  has_many :links, through: :link_tags
  has_many :note_tags
  has_many :notes, through: :note_tags

  belongs_to :user

  validates_presence_of :name

  def self.get(name, user_id)
    tag = Tag.where('lower(name) = ?', name.downcase).find_by(user_id: user_id)
    if tag.nil?
      tag = Tag.create name: name, tag_type: 'default', user_id: user_id
    end
    tag
  end

  def update_link_count
    self.link_count = links.count
    save
  end

  def self.allowed_color?(color)
    allowed_colors = %w(default primary success info warning danger).to_set
    allowed_colors.include?(color)
  end

end
