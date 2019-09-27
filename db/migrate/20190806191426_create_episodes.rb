# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :stream_url
      t.references :anime_translator, foreign_key: true

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
