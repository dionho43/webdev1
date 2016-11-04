module ApplicationHelper
	def signed_in?
		if session[:user_id].nil? #There is no logged in user if true
			return					#This is like a break statement in java
		else						#Else -> this means there is a logged in user
			@current_user = User.find_by_id(session[:user_id])
			#Notice no return statement, even though this is a boolean method
			#Ruby returns the last object in the method
		end
	end
		
	def euro(amount)
	number_to_currency(amount, :unit => '€')
	end
	
	
end
