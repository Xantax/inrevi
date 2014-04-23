class AutoReviewReportsController < ApplicationController
  before_action :set_auto_review_report, only: [:show, :edit, :update, :destroy]
  before_action :set_auto_review

  def index
    @auto_review_reports = @auto_review.auto_review_reports.all
  end

  def show
  end

  def new
    @auto_review_report = AutoReviewReport.new
  end

  def edit
  end

  def create
    @auto_review = AutoReview.find(params[:auto_review_id])
    @auto_review_report = @auto_review.auto_review_reports.new(auto_review_report_params)
    @auto_review_report.user = current_user

    respond_to do |format|
      if @auto_review_report.save
        format.html { redirect_to root_path, notice: 'Auto review report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @auto_review_report }
      else
        format.html { render action: 'new' }
        format.json { render json: @auto_review_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @auto_review_report.update(auto_review_report_params)
        format.html { redirect_to @auto_review_report, notice: 'Auto review report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @auto_review_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auto_review_report.destroy
    respond_to do |format|
      format.html { redirect_to auto_review_reports_url }
      format.json { head :no_content }
    end
  end

  private
  
    def set_auto_review
      @auto_review = AutoReview.find(params[:auto_review_id])
    end

    def set_auto_review_report
      @auto_review_report = AutoReviewReport.find(params[:id])
    end

    def auto_review_report_params
      params.require(:auto_review_report).permit(:content, :user_id, :auto_review_id)
    end
end
