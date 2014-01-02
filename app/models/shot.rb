class Shot < ActiveRecord::Base

  has_many :favorites
  has_many :users, through: :favorites

  IMAGE_MUST_WIDTH=400
  IMAGE_MUST_HEIGHT=300

  paginates_per 6
  acts_as_taggable
  mount_uploader :image, ShotsUploader

  attr_accessor :dimensions, :replaced

  validates :tag_list, presence: true
  validates :description, presence: true, unless: -> { image.present? }
  validates :url, presence: true, unless: -> { image.present? }

  validates :tw_handler, format: {with: /\A[a-z0-9_]+/i, message: "is invalid! *(skip @)"}, if: -> { tw_handler.present? }
  validates :email, format: {with: /\@/, message: "is invalid! "}, if: -> { email.present? }
  validates :description, length: { maximum: 140 }, if: -> { description.present? }

  default_scope -> { order(updated_at: :desc) }

  scope :visible, -> { where(visible: 1) }

  def image= object
    super object
    self.replaced = true
  end

  validate(if: -> { replaced and image.present? }) do |shot|
    if not shot.dimensions.nil?
      unless shot.dimensions[0] == Shot::IMAGE_MUST_WIDTH and shot.dimensions[1] == Shot::IMAGE_MUST_HEIGHT
        errors.add(:image, "dimensions don't match #{Shot::IMAGE_MUST_WIDTH}x#{Shot::IMAGE_MUST_HEIGHT}")
      end
    else
      errors.add(:image, 'dimensions are invalid')
    end
  end

  validate do |shot|
    if not shot.image.present? and shot.visible?
      errors.add(:visible, 'can be set only if image is present')
    end
  end

  def small_url
    url.gsub(/https:\/\/|http:\/\//,"")
  end

  def hidden?
    not visible?
  end

  def toggle_visible!
    if visible?
      update(visible: 0)
    else
      update(visible: 1)
    end
  end

end
