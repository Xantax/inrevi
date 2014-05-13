class ContactFormsController < ApplicationController
  before_action :set_contact_form, only: [:show, :edit, :update, :destroy]

  def index
    @contact_forms = ContactForm.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def show
  end

  def new
    @contact_form = ContactForm.new
  end

  def edit
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)

    respond_to do |format|
      if @contact_form.save
        format.html { redirect_to root_path, notice: 'Contact form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contact_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact_form.update(contact_form_params)
        format.html { redirect_to @contact_form, notice: 'Contact form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact_form.destroy
    respond_to do |format|
      format.html { redirect_to contact_forms_url }
      format.json { head :no_content }
    end
  end

  private

    def set_contact_form
      @contact_form = ContactForm.find(params[:id])
    end

    def contact_form_params
      params.require(:contact_form).permit(:name, :email, :category, :message, :read)
    end
end
