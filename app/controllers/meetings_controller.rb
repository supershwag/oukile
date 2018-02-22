class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:new, :create, :edit, :update, :accept, :decline]

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.loser = current_user
    # @meeting.user = User.find(params)
    @meeting.item = Item.find(params[:item_id])
    authorize @meeting
    if @meeting.save
      redirect_to meeting_path(@meeting)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @meeting.loser = current_user
    authorize @meeting
    @meeting.update(meeting_params)
  end

  def accept
    @meeting.loser = current_user
    redirect_to meeting_path(current_user)
  end

  def decline
    redirect_to user_path(current_user)
  end

  # def destroy
  #   @meeting.loser = current_user
  #   authorize @meeting
  #   @meeting.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:user, :item, :loser, :start_date, :end_date)
    end
  end

