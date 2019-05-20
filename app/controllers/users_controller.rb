class UsersController < ApplicationController
  before_action :authenticate_user!,except: [:complete]

  def top
  end

  def index
    @users = User.all
    @search = User.search(params[:q])
    @users = @search.result
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to users_complete_path
  end

  def delete
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    weight_change = @user.weights.build(weight_change: @user.latest_weight)
    weight_change.save
    redirect_to users_top_path,notice: "編集が完了しました"
    else
    #updateを失敗すると編集ページ
    flash.now[:error] = '更新できませんでした'
      render :edit
    end
    #weight_change = @user.weights.build(weight_change: @user.latest_weight)
    #if weight_change.update()
  end

  def edit_complete
  end

  def complete
  end

   private
  def user_params
    params.require(:user).permit(:name, :gender, :height, :latest_weight, :ideal_weight, :age, :email)
  end
end
