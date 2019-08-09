# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'yaml'

SEED_DIR = 'db/seeds'

animes_file = Rails.root.join("#{SEED_DIR}/anime.yml")
value = YAML.load_file(animes_file)
puts "==> Seeding: Anime"
puts Anime.create(value)
