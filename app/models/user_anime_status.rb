# frozen_string_literal: true

class UserAnimeStatus < ApplicationRecord
  belongs_to :anime
  belongs_to :user

  enum status: %i[in_progress complited throw]
end
