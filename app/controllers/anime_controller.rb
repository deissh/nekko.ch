# frozen_string_literal: true

class AnimeController < ApplicationController
  # GET /anime
  # GET /anime.json
  def index
    list = Anime.page(page).per(limit)
    list = list.search_by_title(search) unless search.empty?
    list = list.where('genres @> ?', "{#{genres}}") if genres
    list = list.where(year: year) unless year.empty?
    list = list.order(sort_by) if sort_by

    @title = 'Поиск'
    @animes = list
    @query = {
      q: search,
      year: year,
      sort_by: sort_by
    }
    respond_to do |format|
      format.html { render :index, layout: 'sidebar' }
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
      format.html { render :show, layout: 'sidebar' }
      format.json { render json: @anime }
    end
  end

  private

  def search
    params[:q] || ''
  end

  def limit
    params[:limit] || 25
  end

  def page
    params[:page] || 1
  end

  def genres
    params[:genres]
  end

  def year
    params[:year] || ''
  end

  def sort_by
    case params[:sort_by]
    when 'title_desc'
      'title DESC'
    when 'title_asc'
      'title ASC'
    when 'rating_desc'
      'rating DESC'
    when 'rating_asc'
      'rating ASC'
    when 'year_desc'
      'year DESC'
    when 'year_asc'
      'year ASC'
    when 'created_at_desc'
      'created_at DESC'
    when 'created_at_asc'
      'created_at ASC'
    when 'updated_at_desc'
      'updated_at DESC'
    when 'updated_at_asc'
      'updated_at ASC'
    else
      # default sort
      'rating DESC'
    end
  end
end
