class AddHideToAnime < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :hide, :boolean, default: false
  end
end
