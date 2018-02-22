class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item).order(created_at: :desc)
    @items = Item.where.not(latitude: nil, longitude: nil)

    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end
  end

  def show
    @item = Item.find(params[:id])
    @dispos = @item.dispos
    authorize @item
  end

  def new
    @item = Item.new
    @dispo = Dispo.new
    # @item.dispos = @dispo
    authorize @item
    authorize @dispo
  end

  def create
    @dispo = Dispo.new(dispo_params)
    @item = Item.new(item_params)
    @item.dispos << @dispo
    @item.finder = current_user
    authorize @item
    authorize @dispo
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @item.finder = current_user
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    @item.finder = current_user
    authorize @item
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.finder = current_user
    authorize @item
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :description, :date_found, :location, :location_detailed, :photo, :reward)
  end

  def dispo_params
    params.require(:item).permit(:start_date, :end_date)
  end
end
