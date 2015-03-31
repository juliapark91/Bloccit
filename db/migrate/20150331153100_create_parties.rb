class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :title
      t.integer :starttime
      t.integer :endtime
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.string :email
      
      t.timestamps null: true
    end
  end
end
