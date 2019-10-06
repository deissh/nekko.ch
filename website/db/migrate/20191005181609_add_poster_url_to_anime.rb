class AddPosterUrlToAnime < ActiveRecord::Migration[5.2]
  def up
    add_column :animes, :poster_url, :string, default: nil, null: true

    Anime.all.each { |anime| anime.update!(poster_url: anime.poster_attachment_path) }
  end

  def down
    remove_column :animes, :poster_url
  end
end
