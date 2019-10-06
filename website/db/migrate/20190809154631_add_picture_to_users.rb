# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddPictureToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :picture, :string, default: 'https://via.placeholder.com/150'
  end
end
# rubocop:enable Style/Documentation
