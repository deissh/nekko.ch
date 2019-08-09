class CreateAnimes < ActiveRecord::Migration[5.2]
  def change
    create_table :animes do |t|
      t.string :title
      t.string :title_en
      t.string :title_or
      t.string :annotation
      t.text :description
      t.string :posters, array: true
      t.string :genres, array: true
      t.string :status
      t.integer :year
      t.numeric :rating
      t.boolean :blocked_ru
      t.boolean :blocked_ua
      t.string :world_art_id
      t.string :kinopoisk_id
      t.string :countries, array: true
      t.string :actors, array: true
      t.string :directors, array: true
      t.string :studios, array: true

      t.timestamps
    end
  end
end
