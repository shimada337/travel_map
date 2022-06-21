class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.integer :area, default: 0, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.text :body, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :image_id
      

      t.timestamps
    end
  end
end
