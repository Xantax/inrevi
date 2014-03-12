class AutosController < ApplicationController
   before_action :set_podcast, only: [:index, :show, :edit, :update, :destroy]
  
  def index
  end 
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auto
      @auto = Auto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auto_params
      params.require(:auto).permit(:name)
    end
  
end
