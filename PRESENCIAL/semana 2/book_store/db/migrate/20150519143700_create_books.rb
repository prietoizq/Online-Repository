class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :name
    	t.text :description
    	t.float :price
    	t.float :mark
      t.timestamps null: false
    end
  end
end
