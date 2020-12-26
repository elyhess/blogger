class Article < ApplicationRecord
  validates_presence_of :title, :body
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect { |s| s.strip.downcase }.uniq
    # go through each of those tag_names and find or create a tag with that name. Rails has a built in method to do just that, like this:
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    # collect up these new or found new tags and then assign them to our article.
    self.tags = new_or_found_tags
  end
end
