class RemoveCountableFromListsAndItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :lists, :countable, :boolean

    # Remove o campo countable da tabela items
    remove_column :items, :countable, :boolean
    remove_column :items, :value, :float
  end
end
