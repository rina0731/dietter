class ContactsController < ApplicationController

	def new
	  @contact = Contact.new
    end

    def create
      contact = Contact.new(contact_params)
  	  contact.user_id = current_user.id
  	  contact.save
      redirect_to users_top_path
      else
          render :new
      end

    def update
    end

    def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def ensure_correct_user
      if current_user.admin == false
        flash[:notice] = "このアクションは許可されていません"
        redirect_to top_users_path
      end
    end

    private
    def contact_params
  	  params.require(:contact).permit(:contact_title, :contact_text)
    end
end

