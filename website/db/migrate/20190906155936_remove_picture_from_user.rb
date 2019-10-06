# frozen_string_literal: true

# rubocop:disable Style/Documentation
class RemovePictureFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :picture
  end
end
# rubocop:enable Style/Documentation
