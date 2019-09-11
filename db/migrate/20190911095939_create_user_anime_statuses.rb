class CreateUserAnimeStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_anime_statuses do |t|
      t.references :anime, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :user_anime_statuses, :status
  end
end
