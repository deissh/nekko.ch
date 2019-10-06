# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, default: 'user'
  end
end
# rubocop:enable Style/Documentation
