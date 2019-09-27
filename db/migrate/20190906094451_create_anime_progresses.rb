# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateAnimeProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :anime_progresses do |t|
      t.references :user
      t.references :anime
      t.references :anime_translator
      t.references :episode

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
