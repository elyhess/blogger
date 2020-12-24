class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings

  # The tag_list method in article model uses join, which by default uses .to_s applied to every element in the array
  # we can override to_s to output the name for each element
  def to_s
    name
  end
end