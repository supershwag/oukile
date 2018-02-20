class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @category = %w(doudou papiers bijoux vetements electronique divers)
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
  end

  def edit
    @category = %w(doudou papiers bijoux vetements electronique divers)
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to items_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :description, :date_found, :location, :location_details, :photo_id, :reward)
  end
end
