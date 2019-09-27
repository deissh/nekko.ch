# frozen_string_literal: true

# rubocop:disable Style/Documentation
class ChangeGenderFieldTypeInUser < ActiveRecord::Migration[5.2]
  def up
    execute 'ALTER TABLE users ALTER gender DROP DEFAULT;'
    change_column :users, :gender, :integer, using: 'gender::integer', default: 0
  end
end
# rubocop:enable Style/Documentation
