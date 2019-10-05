# frozen_string_literal: true

class Episode < ApplicationRecord
  belongs_to :anime_translator

  validates :name, :stream_url, presence: true
end
