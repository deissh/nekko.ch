# frozen_string_literal: true

class AnimeTranslator < ApplicationRecord
  belongs_to :anime
  has_many :episodes, dependent: :destroy

  validates :name, presence: true
end
