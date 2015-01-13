class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render :index, locals: { categories: categories }
  end

  def show
    category = Category.find(params[:id])
    render :show, locals: { category: category, listings: category.listings }
  end
end
