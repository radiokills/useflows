class ShotSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :url, :visible, :description, :image
  attributes :tag_list
  attributes :created_at, :updated_at

  def created_ago
    time_ago_in_words object.created_at
  end

  def updated_ago
    time_ago_in_words object.updated_at
  end

  attributes :created_ago, :updated_ago

  def visible
    object.visible?
  end

end
