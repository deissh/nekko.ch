# frozen_string_literal: true

require 'json'

class AnimeController < ApplicationController
  def full
    @anime = Anime.find(params[:id])

    @title = @anime.title
  end
end
