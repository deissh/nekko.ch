class AddYouTubeTrailerUrlToAnime < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :youtube_trailer_url, :string, default: ''
  end
end
