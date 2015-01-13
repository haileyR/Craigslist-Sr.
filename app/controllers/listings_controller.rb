class ListingsController < ApplicationController
  def new
    listing = Listing.new
    categories = Category.all
    render :new, locals: {listing: listing, categories: categories}
  end

  def show
    listing = Listing.find(params[:id])
    render :show, locals: {listing: listing}
  end

  def create
    listing = Category.find_by_title(params[:category]).listings.build(listing_params)
    if listing.save
      render :show, locals: {listing: listing}
    else
      render :new, locals: {listing: listing}
    end
  end

  def edit
    listing = Listing.find(params[:id])
    categories = Category.all

    if params[:edit_key] == listing.edit_key
      render :edit, locals: {listing: listing, categories: categories}
    else
      redirect_to root_path
    end
  end

  def update
    listing = Listing.find(params[:id])
    listing.update_attributes(listing_params)
    category = Category.find_by_title(params[:category])
    listing.category_id = category.id
    if listing.save
      render :show, locals: {listing: listing}
    else
      render :new, locals: {listing: listing}
    end
  end


  private
    def listing_params
      params.require(:listing).permit(:title, :price, :location, :content, :owner_email)
    end
end
