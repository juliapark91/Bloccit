class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :phone
      t.references :party, index: true

      t.timestamps null: true
    end
  end
end
