class Genre < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: %i[slugged finders history]

  has_and_belongs_to_many :anime
end
