class AnimeProgress < ApplicationRecord
  belongs_to :anime
  belongs_to :anime_translator
  belongs_to :episode
  belongs_to :user
end
