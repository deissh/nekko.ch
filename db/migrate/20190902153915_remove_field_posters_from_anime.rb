# frozen_string_literal: true

require 'open-uri'
require 'json'

class RemoveFieldPostersFromAnime < ActiveRecord::Migration[5.2]
  def self.up
    Anime.all.each do |anime|
      u = if anime.posters.is_a? String
            open(JSON.parse(anime.posters)[0])
          else
            open(anime.posters[0])
          end

      anime.poster.attach(io: u, filename: 'img')
      anime.background.attach(io: u, filename: 'img')
      anime.save!
    end
    remove_column :animes, :posters, :string
  end

  def self.down
    add_column :animes, :posters, :string
    Anime.find_each do |anime|
      anime.posters = [anime.poster.file.service_url]
    end
  end
end
