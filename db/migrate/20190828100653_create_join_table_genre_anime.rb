class CreateJoinTableGenreAnime < ActiveRecord::Migration[5.2]
  def change
    create_join_table :genres, :animes do |t|
      # t.index [:genre_id, :anime_id]
      # t.index [:anime_id, :genre_id]
    end
  end
end
