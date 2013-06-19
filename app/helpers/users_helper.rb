module UsersHelper

	def favourite?
		
	    if current_user.favourites.find_by_song_id(params[:id])
	      return true
	    else
	      return false
	    end
	end

	def editor?(user)

		if user != nil && user.role_id == 2
			return true
		else
			return false
		end
	end

	def him?(id)
		if current_user.id == id
			return true
		else
			return false
		end
	end

end
