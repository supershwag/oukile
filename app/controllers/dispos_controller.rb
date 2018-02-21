class DisposController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @dispo = Dispo.new
    authorize @dispo
  end

  def create
    @dispo = Dispo.new(dispo_params)
    @dispo.item = Item.find(params[:item_id])
    authorize @dispo
    if @dispo.save
      redirect_to item_path(@dispo.item)
    else
      render :new
    end
  end

  private

  def dispo_params
    params.require(:dispo).permit(:start_date, :end_date)
  end
end
