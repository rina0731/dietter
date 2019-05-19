class WeightsController < ApplicationController

	def new
	  @weight = Weight.new
	  @user = current_user
	  latest_weight = @user.weight
    end

    def calc
      @weight = Weight.new
	  @user = current_user
	  latest_weight = @user.weight
	end

    def index
      @weight = Weight.all
      @user = current_user
	  latest_weight = @user.weight

	  #１人のユーザーのweightモデル内のlatest_weightカラムの値を全て取得
      weights = Weight.where(:user_id =>@user.id).pluck(:latest_weight)
      @categories = Weight.where(:user_id =>@user.id).pluck(:created_at)
      @categories2=@categories.map do |category|
      	category.strftime('%Y/%m/%d')
      end
      #ideal_weights = User.where(:user_id =>@user.id).pluck(:ideal_weight)
      #require 'date'
      #date = DateTime.parse(str).to_s
      # 1日ずつループ
     #date = ['%Y:%m:%d'] # 他の形式が必要になったら、この配列に追加
     #date.each do |format|

    #end

      # これまでの体重変化を元に折れ線グラフを作成
	  #@end_at = Date.today
      #@start_at = @end_at - 6
      #@categories = @start_at.upto(@end_at).to_a

      @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'これまでの変化')
      #f.title(:text => @user.weight)
      f.xAxis(:categories => @categories2)
      f.yAxis(:title => {:text => ""})
      f.series(name: '体重', data: weights)
      #f.series(name: '', data: ideal_weight)


    end
end
end
