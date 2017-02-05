class User < ActiveRecord::Base
  has_secure_password

  scope :admins, -> { where(admin: true) }

  validates_presence_of :name, :surname, :city, :login, :password
end
