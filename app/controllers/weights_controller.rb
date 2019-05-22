class WeightsController < ApplicationController
  before_action :authenticate_user!

	def new
	  @weight = Weight.new
	  @user = current_user
	  weight = @user.latest_weight
    end

    def calc
      @weight = Weight.new
	  @user = current_user
	  weight = @user.latest_weight
	end

    def index
      @weight = Weight.all
      @user = current_user
	  weight = @user.latest_weight


	  #１人のユーザーのweightモデル内のlatest_weightカラムの値を全て取得
      weights = Weight.where(:user_id =>@user.id).pluck(:weight_change)
      @categories = Weight.where(:user_id =>@user.id).pluck(:created_at)
      @categories2=@categories.map do |category|
      	category.strftime('%Y/%m/%d')
      end

      #ideal_weights = User.where(:user_id =>@user.id).pluck(:ideal_weight)

      @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: '')
      #f.title(:text => @user.weight)
      f.xAxis(:categories => @categories2)
      f.yAxis(:title => {:text => "kg"})
      f.series(name: '体重', data: weights)
      #f.series(name: '', data: @user.ideal_weight)
      end
    end
end
