class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image

      t.timestamps
    end
  end
end
