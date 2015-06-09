class ItemsController < ApplicationController

	include ItemsHelper

	def index
		@user = User.find(params[:user_id])
		@items = Item.all.order(:expiration)
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

	#def destroy
		#@item = current_user.items.find(params[:name])
		#if Date.today == item.expiration
			#@item.destroy
			#redirect_to user_items_path
		#end
	#end

	def claim
		update_attribute(:claimed, true)
	end

	private
	

	def item_params
		params.require(:item).permit(:name, :quantity, :expiration, :location)
	end
end
