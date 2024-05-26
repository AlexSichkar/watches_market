class WatchesController < ApplicationController
  #### before_action :require_authentication, except: %i[show index]
  before_action :authorize_watch!
  after_action :verify_authorized
  def index
    # @watches = Watch.all
    # @watches = (Watch.all == nil) ? ("null") : (Watch.all)
    # @watches = Watch.order(params[:sort])
  end

  def sort
    @watches = Watch.order(params[:sort])
  end

  def show
    # @watch = Watch.find(params[:id])
    @watch = Watch.find_by name: params[:name]
    # authorize @watch
  end

  def edit
    @watch = Watch.find_by id: params[:id]
  end

  def new
    @watch = Watch.new
  end

  def create
    @watch = Watch.new watch_params
    if @watch.save
      redirect_to watches_path
    else
      render :new
    end
  end

  def update
    @watch = Watch.find_by id: params[:id]
    if @watch.update watch_params
      redirect_to watches_path
    else
      render :edit
    end
  end

  def destroy
    @watch = Watch.find_by id: params[:id]
    @watch.destroy
    redirect_to watches_path
  end

  def search
    @length =  Array.new(Category.maximum(:id)){|index| index+1}

    price_min = params[:price_min].present? ? params[:price_min].to_i : 1
    price_max = params[:price_max].present? ? params[:price_max].to_i : 1000000
    category_id = params[:category_id].max.blank? ? @length : params[:category_id]

    @watches = Watch.watches_search(params[:watch_name],
                                    category_id,price_min, price_max)
  end

  private
  def watch_params
    params.require(:watch).permit(:name, :description, :category_id, :price, :view_url)
  end

  def authorize_watch!
    authorize(@watch || Watch)
  end

end