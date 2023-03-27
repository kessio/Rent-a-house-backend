class RemoveImageFfromHouse < ActiveRecord::Migration[7.0]
  def change
    remove_column :houses, :image, :text
  end
end
