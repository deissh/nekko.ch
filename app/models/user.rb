# frozen_string_literal: true

class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders]

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  RESERVED_NAMES = %w[
    admin administrator connect dashboard developer developers edit favorites
    feature featured features feed follow followers following hummingbird index
    javascript json kitsu sysadmin sysadministrator system unfollow user users
    wiki you staff mod
  ].to_set.freeze
  PAST_NAMES_LIMIT = 10

  enum role: %i[user supporter developer vip]
  enum theme: %i[default]
  enum gender: %i[not_set male female]

  has_many :anime_progresses
  has_one_attached :avatar
  has_one_attached :background

  validates :email, format: { with: /\A.*@.*\..*\z/, message: 'is not an email' },
                    if: :email_changed?, allow_blank: true
  validates :about, length: { maximum: 500 }
  validates :gender, length: { maximum: 20 }
  with_options if: :slug_changed?, allow_nil: true do
    validates :slug, uniqueness: { case_sensitive: false }
    validates :slug, format: {
      with: /\A[_A-Za-z0-9]+\z/,
      message: 'can only contain letters, numbers, and underscores'
    }
    validates :slug, format: {
      with: /\A[A-Za-z0-9]/,
      message: 'must begin with a letter or number'
    }
    validates :slug, format: {
      without: /\A[0-9]*\z/,
      message: 'cannot be entirely numbers'
    }
    validates :slug, length: 3..20
  end
  validate :not_reserved_slug, if: ->(user) { user.slug.present? && user.slug_changed? }
  validate :not_reserved_name, if: :name_changed?
  validates :name, presence: true,
                   length: { minimum: 3, maximum: 20 },
                   if: ->(user) { user.name_changed? }

  scope :active, -> { where(deleted_at: nil) }

  before_update do
    if name_changed?
      # Push it onto the front and limit
      self.also_name = [name_was, *also_name].first(PAST_NAMES_LIMIT)
    end
  end

  def avatar_path
    if avatar.attached?
      "https://301222.selcdn.ru/nekko-ch-cdn1/#{avatar.attachment.key}"
    else
      # 'https://301222.selcdn.ru/nekko-ch-cdn1/assets/user-default-avatar.jpg'
      'https://via.placeholder.com/450x450'
    end
  end

  def background_path
    if background.attached?
      "https://301222.selcdn.ru/nekko-ch-cdn1/#{background.attachment.key}"
    else
      'https://301222.selcdn.ru/nekko-ch-cdn1/assets/user-default-background.jpg'
    end
  end

  def gender_converted
    case gender
    when 'female'
      'Женский'
    when 'male'
      'Мужской'
    else
      'Не указано'
    end
  end

  def language_converted
    case language
    when 'ru'
      'Русский'
    when 'en'
      'Английский'
    else
      'Не указан'
    end
  end

  def anime_statuses(type)
    UserAnimeStatus
      .where(user: id, status: type)
      .includes(:anime)
      .map(&:anime)
  end

  private

  def not_reserved_slug
    errors.add(:slug, 'is reserved') if RESERVED_NAMES.include?(slug&.downcase)
  end

  def not_reserved_name
    errors.add(:name, 'is reserved') if RESERVED_NAMES.include?(name.downcase)
  end
end
