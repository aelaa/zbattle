class Battle::Work < ActiveRecord::Base
  has_many :images, as: :owner

  accepts_nested_attributes_for :images

  belongs_to :user
end
