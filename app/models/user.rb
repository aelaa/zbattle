class User < ActiveRecord::Base
  has_secure_password
  has_many :battle_works, class_name: Battle::Work

  scope :admins, -> { where(admin: true) }

  validates_presence_of :name, :surname, :city, :login, :password
end
