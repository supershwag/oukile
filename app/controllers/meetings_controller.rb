class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to user_meeting_path
    else
      render 'meetings/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @meeting.update(meeting_params)
  end

  def destroy
    @meeting.destroy
  end

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

