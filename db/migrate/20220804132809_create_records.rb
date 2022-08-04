class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :amount, null:false
      t.string :category, null:false
      t.text :note

      t.timestamps
    end
  end
end
