class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def index
    if current_user.admin?
      @alerts = Alert.paginate(:page => params[:page], :per_page => 15).order("created_at DESC")
    end
  end

  def show
    unless current_user.admin || current_user.company
      redirect_to root_path
    end
  end

  def new
    if current_user.admin || current_user.company
      @alert = Alert.new
    end
  end

  def edit
    unless current_user.admin || current_user.company
      redirect_to root_path
    end
  end

  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user
    
      if @alert.save
        @alert.create_activity :create, owner: current_user
        redirect_to current_user
      else
        render action: 'new'
      end
  end

  def update
      if @alert.update(alert_params)
        redirect_to @alert
      else
        render action: 'edit'
      end
  end

  def destroy
    @alert.destroy
    redirect_to current_user
  end

  private

    def set_alert
      @alert = Alert.find(params[:id])
    end

    def alert_params
      params.require(:alert).permit(:user_id, :content)
    end
end
