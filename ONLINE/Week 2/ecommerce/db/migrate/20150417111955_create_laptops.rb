class CreateLaptops < ActiveRecord::Migration
  def change
    create_table :laptops do |t|
      t.string :name
      t.text :brand
      t.text :model
      t.text :processor
      t.float :ram
      t.float :price

      t.timestamps null: false
    end
  end
end
