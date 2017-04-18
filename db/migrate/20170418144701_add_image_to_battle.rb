class AddImageToBattle < ActiveRecord::Migration
  def change
    add_attachment :battles, :image
  end
end
