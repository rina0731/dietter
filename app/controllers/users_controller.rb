class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:complete]
  before_action :admin_user, only: [:index, :show]

  def index
    @users = User.all
    @search = User.search(params[:q])
    @user = @search.result
    @users = @search.result.page(params[:page]).per(10)
    @user_id = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @user_id = current_user.id
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to users_complete_path
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      weight_change = @user.weights.build(weight_change: @user.latest_weight)
      weight_change.save
      redirect_to users_top_path,notice: "編集が完了しました"
    else
      #updateを失敗すると編集ページに戻る
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

   private
    def user_params
      params.require(:user).permit(:name, :gender, :height, :latest_weight, :ideal_weight, :age, :email)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
