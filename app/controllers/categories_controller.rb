class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render :index, locals: { categories: categories }
  end
end
