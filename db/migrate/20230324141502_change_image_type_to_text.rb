class ChangeImageTypeToText < ActiveRecord::Migration[7.0]
  def change
    change_column :houses, :image, :text
  end
end
