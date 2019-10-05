# frozen_string_literal: true

class Anime < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :title_en, use: %i[slugged finders history]

  pg_search_scope :search_by_title,
    against: %i[title title_en title_or], using: [:tsearch]

  has_one_attached :poster
  has_one_attached :background

  has_many :anime_progresses
  has_many :anime_translators, dependent: :destroy
  has_and_belongs_to_many :genres

  scope :short, -> { includes(:genres).where(hide: false) }
  scope :full, -> { includes(:genres, :anime_translators) }

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
      Rails.configuration.cdn_baseUrl + poster.attachment.key
    else
      Rails.configuration.cdn_fallbackUrl
    end
  end

  def background_attachment_path
    if background.attached?
      Rails.configuration.cdn_baseUrl + background.attachment.key
    else
      poster_attachment_path
    end
  end

  before_update do
    # обновляем ссылку на постер
    self.poster_url = poster_attachment_path
  end

  private

  def reindex
    PgSearch::Multisearch.rebuild(Anime)
  end
end
