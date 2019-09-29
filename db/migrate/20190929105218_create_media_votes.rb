class CreateMediaVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :media_votes do |t|
      t.references :media, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :vote, null: false

      t.timestamps
    end
  end
end
