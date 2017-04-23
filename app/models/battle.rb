class Battle < ActiveRecord::Base
  scope :current, -> { where('deadline > ?', DateTime.now) }

  has_one :image, as: :owner
  has_many :works

  accepts_nested_attributes_for :image

  def current?
    deadline > DateTime.now
  end
end
