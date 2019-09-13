class AddPrivateSettingsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :private_info, :boolean, default: false
    add_column :users, :private_statuses, :boolean, default: false
  end
end
