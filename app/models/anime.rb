# frozen_string_literal: true

class Anime < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title, :title_en, :title_or], using: [:tsearch]

  has_many :anime_translators, dependent: :destroy

  def translators
    anime_translators
  end

  private
  def reindex
    PgSearch::Multisearch.rebuild(Anime)
  end
end
