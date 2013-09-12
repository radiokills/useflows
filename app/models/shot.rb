class Shot < ActiveRecord::Base
  include ActiveModel::Validations

  IMAGE_MUST_WIDTH=360
  IMAGE_MUST_HEIGHT=360

  acts_as_taggable
  mount_uploader :image, ShotsUploader

  attr_accessor :dimensions


  validates :tag_list, presence: true
  validates :url, presence: true, if: ->{ not image.present? }
  validates :image, presence: true, if: ->{ not image.url.present? }


  # TODO: Only if image was changes
  validate(on: :create) do |shot|

    unless shot.dimensions.nil?
      if shot.dimensions[0] == Shot::IMAGE_MUST_WIDTH and shot.dimensions[1] == Shot::IMAGE_MUST_HEIGHT
        true
      else
        errors.add(:image, "image must have dimensions of #{Shot::IMAGE_MUST_WIDTH}x#{Shot::IMAGE_MUST_HEIGHT}")
      end
    else
      errors.add(:image, 'dimensions of this image are invalid.')
    end

  end

  def hidden?
    not visible?
  end

end
