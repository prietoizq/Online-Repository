class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.text :description
    	t.date :date_limit
    	t.string :user
    	t.float :price

      t.timestamps null: false
    end
  end
end
