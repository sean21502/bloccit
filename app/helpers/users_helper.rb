module UsersHelper
	def user_has_posts?
    	@user.posts.empty?
	end
	
	def user_has_comments?
		@user.comments.empty?
	end
	
	def user_has_favorites?
		@user.avatar_url(128)
		@user.posts.count
		@user.comments.count
	end
end
