module ItemsHelper
	def can_add_item?(item)
		item.user == giver 
	end
end
