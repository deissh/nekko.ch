class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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


  validates :email, format: { with: /\A.*@.*\..*\z/, message: 'is not an email' },
                    if: :email_changed?, allow_blank: true
  validates :about, length: { maximum: 500 }
  validates :gender, length: { maximum: 20 }


  scope :active, -> { where(deleted_at: nil) }

  before_update do
    if name_changed?
      # Push it onto the front and limit
      self.past_names = [name_was, *past_names].first(PAST_NAMES_LIMIT)
    end
  end
end
