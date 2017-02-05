class Battle < ActiveRecord::Base
  def current
    where('deadline < ?', DateTime.now)
  end
end
