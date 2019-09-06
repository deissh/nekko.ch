# frozen_string_literal: true

class Anime < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :title_en, use: %i[slugged finders history]

  pg_search_scope :search_by_title,
                  against: %i[title title_en title_or], using: [:tsearch]

  has_many :anime_translators, dependent: :destroy

  has_and_belongs_to_many :genres

  has_one_attached :poster
  has_one_attached :background

  has_many :anime_progresses

  def last_watch(user_id)
    anime_progresses
      .where(user: user_id)
      .order(created_at: :desc).first!
  end

  def translators
    anime_translators
  end

  def genres_list
    genres.map(&:name)
  end

  def poster_attachment_path
    if poster.attached?
      "https://301222.selcdn.ru/nekko-ch-cdn1/#{poster.attachment.key}"
    else
      'https://via.placeholder.com/300x450'
    end
  end

  def background_attachment_path
    if background.attached?
      "https://301222.selcdn.ru/nekko-ch-cdn1/#{background.attachment.key}"
    else
      'https://via.placeholder.com/300x450'
    end
  end

  private

  def reindex
    PgSearch::Multisearch.rebuild(Anime)
  end
end
