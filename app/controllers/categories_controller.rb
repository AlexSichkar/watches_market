class CategoriesController < ApplicationController

  def index
    @categories = (Category.all == nil) ? ("null") : (Category.all)
  end
  def show
    @category = Category.find_by id: params[:id]
    @watches = Watch.where(category_id: @category)
  end
end
