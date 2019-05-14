class WeightsController < ApplicationController

	def new
	  @weight = Weight.new
	  @user = current_user
	  latest_weight = @user.weight
    end


end
