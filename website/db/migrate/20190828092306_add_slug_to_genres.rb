# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddSlugToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :slug, :string
    add_index :genres, :slug, unique: true
  end
end
# rubocop:enable Style/Documentation
