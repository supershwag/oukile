class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item).order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def new
    @category = %w(doudou papiers bijoux vêtements électronique divers)
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
    @category = %w(doudou papiers bijoux vetements electronique divers)
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    @item.finder = current_user
    authorize @item
    @item.update(item_params)
    redirect_to item_path(@item)
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
