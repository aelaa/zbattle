class Battle < ActiveRecord::Base
  scope :current, -> { where('deadline > ?', DateTime.now) }

  def current?
    deadline > DateTime.now
  end
end
