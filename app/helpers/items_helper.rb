module ItemsHelper
	def can_add_item?
		current_user.giver == true
	end
end
