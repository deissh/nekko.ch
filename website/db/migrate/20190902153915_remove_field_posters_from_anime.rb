# frozen_string_literal: true

require 'open-uri'
require 'json'

# rubocop:disable Style/Documentation
class RemoveFieldPostersFromAnime < ActiveRecord::Migration[5.2]
  # rubocop:disable Metrics/MethodLength
  def self.up # rubocop:disable Metrics/AbcSize
    Anime.all.each do |anime|
      u = if anime.posters.is_a? String
            # rubocop:disable Security/Open
            open(JSON.parse(anime.posters)[0])
            # rubocop:enable Security/Open
          else
            open(anime.posters[0]) # rubocop:disable Security/Open
          end

      anime.poster.attach(io: u, filename: 'img')
      anime.background.attach(io: u, filename: 'img')
      anime.save!
    end
    remove_column :animes, :posters, :string
  end
  # rubocop:enable Metrics/MethodLength

  def self.down
    add_column :animes, :posters, :string
    Anime.find_each do |anime|
      anime.posters = [anime.poster.file.service_url]
    end
  end
end
# rubocop:enable Style/Documentation
