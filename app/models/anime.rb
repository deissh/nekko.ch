# frozen_string_literal: true

class Anime < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :title_en, use: %i[slugged finders history]

  pg_search_scope :search_by_title,
                  against: %i[title title_en title_or], using: [:tsearch]

  has_many :anime_translators, dependent: :destroy

  def translators
    anime_translators
  end

  private

  def reindex
    PgSearch::Multisearch.rebuild(Anime)
  end
end
