class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user, only: [:index, :show]

	def new
	  @contact = Contact.new
    end

    def create
      @contact = Contact.new(contact_params)
  	  @contact.user_id = current_user.id
  	  if @contact.save
      redirect_to users_top_path,notice: "送信しました"
      else
        flash.now[:alert] = "エラー：送信できませんでした"
        render :new
      end
    end

    def update
    end

    def index
      @contacts = Contact.all.order(created_at: :desc)
      @user_id = current_user.id
      @contacts = Contact.page(params[:page]).per(3)
    end

    def show
      @contact = Contact.find(params[:id])
      @user_id = current_user.id
    end

    def ensure_correct_user
      if current_user.admin == false
        flash[:notice] = "このアクションは許可されていません"
        redirect_to top_users_path
      end
    end

    private
    def contact_params
  	  params.require(:contact).permit(:contact_title, :contact_text,:reply)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

