class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	t.integer :book_id
    	t.string :user
    	t.integer :rating
    	t.text :comment
      t.timestamps null: false
    end
  end
end
