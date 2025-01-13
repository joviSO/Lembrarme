class AddDeadlineAndStatusOnLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :deadline, :date
    add_column :lists, :status, :integer, default: 0
    add_column :lists, :repeat, :boolean, default: false
    add_column :lists, :repeat_frequency, :date
  end
end
