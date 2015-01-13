class ListingsController < ApplicationController
  def new
    listing = Listing.new
    categories = Category.all
    render :new, locals: {listing: listing, categories: categories}
  end

  def create
    p params[:category]
    listing = Category.find_by_title(params[:category]).listings.build(listing_params)
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
