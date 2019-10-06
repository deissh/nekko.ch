# frozen_string_literal: true

# rubocop:disable Style/Documentation
class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
