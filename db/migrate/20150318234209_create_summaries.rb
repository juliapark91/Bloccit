class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.string :body
      t.references :post, index: true
      
      t.timestamps null: false
    end
  end
end
