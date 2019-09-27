# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateAnimeTranslators < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_translators do |t|
      t.string :name
      t.integer :translator_id
      t.references :anime, foreign_key: true

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
