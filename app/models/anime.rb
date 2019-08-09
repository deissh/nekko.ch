class Anime < ApplicationRecord
  has_many :anime_translators, dependent: :destroy

  def translators
    anime_translators
  end
end
