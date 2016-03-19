class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float  :price
      t.string :image
      t.integer :user_id
      t.integer :shop_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
