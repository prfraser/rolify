class ProfileController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = current_user
		if params[:role]
			@users = User.with_role(params[:role])
		else
			@users = User.all
		end 
	end

	def show
		@user = User.find(params[:id])
	end

	private

  def user_params
	  params.require(:user).permit(:role)
	end
end
