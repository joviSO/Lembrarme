class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :description, null: false
      t.references :list, null: false, foreign_key: true
      t.boolean :countable, default: false, null: false
      t.boolean :checked, default: false, null: false
      t.float :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
