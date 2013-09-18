class PatternGroup < ActiveRecord::Base

  has_many :shots, dependent: :destroy

  validates :name, presence: true

  default_scope ->{ order(name: :asc) }

  def to_s
    name
  end

end
