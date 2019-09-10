class RenamePastNamesToAlsoName < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :past_names
    add_column :users, :also_name, :string, default: [], array: true
  end
end
