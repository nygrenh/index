class Tag < ActiveRecord::Base
  include Timestamped

  has_many :link_tags, dependent: :destroy
  has_many :links, through: :link_tags
  has_many :note_tags
  has_many :notes, through: :note_tags

  belongs_to :user

  validates_presence_of :name
  validates :color, inclusion: { in: Color.colors, message: '%{value} is not a valid color' }

  before_validation :ensure_tag_has_color

  def self.get(name, user_id)
    tag = Tag.where('lower(name) = ?', name.downcase).find_by(user_id: user_id)
    tag ||= Tag.create name: name, user_id: user_id
    tag
  end

  # Counter cache updates don't trigger any callbacks
  def self.decrement_counter(counter_name, id)
    super
    Tag.where(id: id).take.instance_eval(&:cleanup)
  end

  protected

  def ensure_tag_has_color
    self.color = Color.random_color unless color
  end

  def cleanup
    destroy if links.count == 0
  end
end
