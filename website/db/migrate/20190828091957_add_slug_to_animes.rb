# frozen_string_literal: true

# rubocop:disable Style/Documentation
class AddSlugToAnimes < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :slug, :string
    add_index :animes, :slug, unique: true
  end
end
# rubocop:enable Style/Documentation
