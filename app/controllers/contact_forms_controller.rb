class ContactFormsController < ApplicationController
  before_action :set_contact_form, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  def index
    @contact_forms = ContactForm.paginate(:page => params[:page], :per_page => 15).order('created_at DESC')
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
    @contact_form.user = current_user

      if @contact_form.save
        redirect_to root_path, notice: 'Thank you. We will contact you soon.'
      else
        render action: 'new'
      end
  end

  def update
      if @contact_form.update(contact_form_params)
        redirect_to @contact_form
      else
        render action: 'edit'
      end
  end

  def destroy
    @contact_form.destroy
    redirect_to contact_forms_url
  end

  private

    def set_contact_form
      @contact_form = ContactForm.find(params[:id])
    end

    def contact_form_params
      params.require(:contact_form).permit(:name, :email, :category, :message, :read, :user_id)
    end
end
