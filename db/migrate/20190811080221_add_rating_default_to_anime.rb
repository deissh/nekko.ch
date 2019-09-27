class AddRatingDefaultToAnime < ActiveRecord::Migration[5.2]
  def change
    change_column_default(
      :animes,
      :rating,
      from: nil,
      to: 5.0
    )
  end
end
