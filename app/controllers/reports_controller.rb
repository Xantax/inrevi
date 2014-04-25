class ReportsController < ApplicationController
  before_filter :load_reportable
  
  def index
    @reports = @reportable.reports
  end

  def new
    @report = @reportable.reports.new
  end

  def create
    @report = @reportable.reports.new(report_params)
    @report.user = current_user
    
    if @report.save
      redirect_to :back
    else
      render :new
    end
  end

  private

    def load_reportable
      resource, id = request.path.split('/')[1, 2]
      @reportable = resource.singularize.classify.constantize.find(id)
    end
    
    def report_params
        params.require(:report).permit(:content)
    end
  
end
