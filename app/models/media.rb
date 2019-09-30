class Media < ApplicationRecord
  has_one :anime

  enum media_type: {
      other: 0,
      sequel: 1,
      prequel: 2,
      alternative_setting: 3,
      alternative_version: 4,
      side_story: 5,
      parent_story: 6,
      summary: 7,
      full_story: 8,
      spinoff: 9,
      adaptation: 10,
      character: 11
  }

  validates :media_type, presence: true
  validates :rating, presence: true, inclusion: 0..10
end
