class ItemsController < ApplicationController
	include ItemsHelper
	before_action :authenticate_user!
	before_filter :load_user

	def index
		@items = @user.present? ? @user.items : Item.all.order(:location, :expiration)
	end

	def new
		@item = Item.new
	end


	def create
		@item = current_user.items.build(item_params)
		if @item.save
			redirect_to user_items_path
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = current_user.items.find(params[:id])
		if @item.update(item_params)
			redirect_to user_items_path
		else
			render :edit
		end
	end

	def destroy
		@item = current_user.items.find(params[:id])
		@item.destroy
		#if Date.today == item.expiration
			#@item.destroy
		redirect_to authenticated_root_path
		#end
	end

	def claim
		@item = Item.find(params[:id])
		@item.update_attribute(:claimed, true)
		redirect_to items_path
	end

	def load_user
		@user= User.find(params[:user_id]) if params[:user_id].present?
	end

	private
	

	def item_params
		params.require(:item).permit(:name, :quantity, :expiration, :location)
	end
end
