class Shot < ActiveRecord::Base

  IMAGE_MUST_WIDTH=360
  IMAGE_MUST_HEIGHT=360

  belongs_to :pattern_group

  # acts_as_taggable
  mount_uploader :image, ShotsUploader

  attr_accessor :dimensions, :replaced

  # validates :tag_list, presence: true
  validates :description, presence: true, unless: -> { image.present? }
  validates :url, presence: true

  validates :pattern_group, associated: true
  validates :pattern_group_id, presence: true

  default_scope -> { order(updated_at: :desc) }

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

  def small_url
    url.gsub(/https:\/\/|http:\/\//,"")
  end

  def hidden?
    not visible?
  end

end
