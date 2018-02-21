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
    authorize @item
  end

  def new
    @category = ["Bijoux", "Électronique", "Papiers d'identité", "Peluche", "Vêtements",  "Divers"]
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.finder = current_user
    authorize @item
    if @item.save
      redirect_to edit_item_path(@item)
    else
      render :new
    end
  end

  def edit
    @category = ["Bijoux", "Électronique", "Papiers d'identité", "Peluche", "Vêtements",  "Divers"]
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :category, :description, :date_found, :location, :location_details, :photo_id, :reward)
  end
end
