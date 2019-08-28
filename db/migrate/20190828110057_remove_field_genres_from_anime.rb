class RemoveFieldGenresFromAnime < ActiveRecord::Migration[5.2]
  def change
    remove_column :animes, :genres, :string
  end
end
