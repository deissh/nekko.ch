# frozen_string_literal: true

# rubocop:disable Style/Documentation
class RemoveFieldGenresFromAnime < ActiveRecord::Migration[5.2]
  def change
    remove_column :animes, :genres, :string
  end
end
# rubocop:enable Style/Documentation
