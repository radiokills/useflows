class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :shot
end
