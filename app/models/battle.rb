class Battle < ActiveRecord::Base
  scope :current, -> { where('deadline > ?', DateTime.now) }

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def current?
    deadline > DateTime.now
  end
end
