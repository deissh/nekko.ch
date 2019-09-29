class CreateMedia < ActiveRecord::Migration[5.2]
  def up
    create_table :media do |t|
      t.boolean :nsfw, default: false, null: false
      t.integer :media_type, default: 0, null: false
      t.integer :rating, null: false, default: 5.0

      t.timestamps
    end

    add_reference :animes, :media, foreign_key: true

    Anime.all.each do |anime|
      media = Media.create!(rating: anime.rating)
      anime.update(media: media)
    end

    remove_column :animes, :rating
  end

  def down
    add_column :animes, :rating, :integer, default: 5.0

    Media.all.each { |media| media.anime.update!(rating: media.rating) }

    remove_reference :animes, :media
    drop_table :media
  end
end
