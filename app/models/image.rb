class Image < ActiveRecord::Base
  has_attached_file :image

  belongs_to :owner, polymorphic: true

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def url
    image.url
  end
end
