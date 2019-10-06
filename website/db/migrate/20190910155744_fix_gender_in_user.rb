# frozen_string_literal: true

# rubocop:disable Style/Documentation
class FixGenderInUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :gender, :string, default: '0'
  end
end
# rubocop:enable Style/Documentation
