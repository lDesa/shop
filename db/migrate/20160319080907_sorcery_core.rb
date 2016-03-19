class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :surname
    	t.string :phone_number
    	t.string :image
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end