class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:new, :create, :edit, :update, :accept, :decline, :destroy]

  def new
    @meeting = Meeting.new
    authorize @meeting
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.loser = current_user
    authorize @meeting

    if @meeting.save
      redirect_to user_path(current_user)
    else
      render :item
    end
  end

  def show
  end

  def edit
  end

  def update
    # @meeting.loser = current_user
    # authorize @meeting
    # @meeting.update(meeting_params)
  end

  def accept
  end

  def decline
  end

  def destroy
    # @meeting.loser = current_user
    # /items/:item_id/meetings/:id
    @meeting = Meeting.find(params[:id])
    authorize @meeting
    @meeting.destroy
    redirect_to user_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:dispo_id)
    end
  end

