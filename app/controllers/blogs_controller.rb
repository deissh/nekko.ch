# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.page(page).per(limit)
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show; end

  private

  def limit
    params[:limit] || 25
  end

  def page
    params[:page] || 1
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
    @blog.increment(:views, 1).save
  end
end
