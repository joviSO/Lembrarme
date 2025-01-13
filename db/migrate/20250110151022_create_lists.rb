class CreateLists < ActiveRecord::Migration[7.1]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :category, default: 0
      t.boolean :countable, default: false

      t.timestamps
    end
  end
end
