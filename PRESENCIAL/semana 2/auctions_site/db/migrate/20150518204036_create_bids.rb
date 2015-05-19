class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
    	t.integer :product_id
    	t.float :offer
    	t.string :user_offer
    	t.date :date

      t.timestamps null: false
    end
  end
end
