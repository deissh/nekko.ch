# frozen_string_literal: true

# rubocop:disable Style/Documentation
class MoreFieldsInUser < ActiveRecord::Migration[5.2]
  def change # rubocop:disable Metrics/MethodLength
    add_column :users, :name, :text, unique: true
    add_column :users, :past_names, :text, unique: true

    add_column :users, :about, :text
    add_column :users, :bio, :text
    add_column :users, :birthday, :date
    add_column :users, :gender, :string, default: 'not_set'
    add_column :users, :language, :string, default: 'ru'
    add_column :users, :location, :string
    add_column :users, :theme, :string, default: 'default'
    add_column :users, :waifu_or_husbando, :string

    add_index :users, :name, unique: true
    add_index :users, :birthday
  end
end
# rubocop:enable Style/Documentation
