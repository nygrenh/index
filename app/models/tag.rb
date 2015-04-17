class Tag < ActiveRecord::Base
  include Timestamped
  extend Gettable

  has_many :link_tags, dependent: :destroy
  has_many :links, through: :link_tags
  has_many :tagged, through: :taggables

  belongs_to :user

  validates :name, presence: true
  validates :color, inclusion: { in: Color.colors, message: '%{value} is not a valid color' }

  before_validation :ensure_tag_has_color

  # Counter cache updates don't trigger any callbacks
  def self.decrement_counter(counter_name, id)
    super
    Tag.find_by(id: id).instance_eval(&:cleanup)
  end

  protected

  def ensure_tag_has_color
    self.color = Color.random_color unless color
  end

  def cleanup
    destroy if links.count == 0
  end
end
