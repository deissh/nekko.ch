# frozen_string_literal: true

class AnimeController < ApplicationController
  # GET /anime
  # GET /anime.json
  def index
    list = Anime
    list = list.search_by_title(search) if search
    list = list.limit(limit)
    list = list.offset(page)
    list = list.where('genres @> ?', "{#{genres}}") if genres
    list = list.where(year: year) if year
    list = list.order(sort_by) if sort_by

    @title = 'Поиск'
    @animes = list
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @animes }
    end
  end

  # GET /anime/1
  # GET /anime/1.json
  def show
    @anime = Anime.find(params[:id])
    @title = @anime.title
    @desc = @anime.description

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @anime }
    end
  end

  private

  def search
    params[:q]
  end

  def limit
    params[:limit] || 25
  end

  def page
    (params[:page].to_i || 0) * limit.to_i
  end

  def genres
    params[:genres]
  end

  def year
    params[:year]
  end

  def sort_by
    case params[:sort_by]
    when 'rating_desc'
      return 'rating DESC'
    when 'rating_asc'
      return 'rating ASC'
    when 'year_desc'
      return 'year DESC'
    when 'year_asc'
      return 'year ASC'
    when 'created_at_desc'
      return 'created_at DESC'
    when 'created_at_asc'
      return 'created_at ASC'
    when 'updated_at_desc'
      return 'updated_at DESC'
    when 'updated_at_asc'
      return 'updated_at ASC'
    else
      # default sort
      return 'rating DESC'
    end
  end
end
