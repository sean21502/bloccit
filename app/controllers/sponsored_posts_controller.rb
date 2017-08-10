class SponsoredPostsController < ApplicationController
  def index
	  @
  end

  def show
  end

  def new
  end

  def edit
  end
end

class QuestionsController < ApplicationController
  def index
	  @sponsoredPosts = SponsoredPost.all
  end

  def show
	  @sponsoredPost = SponsoredPost.find(params[:id])
  end

  def new
	  @sponsoredPost = SponsoredPost.new
  end
	
  def create
	  @sponsoredPost = SponsoredPost.new(params.require(:question).permit(:title, :body, :resolved))
	  
	  if @sponsoredPost.save
		  flash[:notice] = "Post was saved"
		  redirect_to @sponsoredPost
	  else
		  flash[:error] = "Oops. you made an uh-oh. Don't screw up next time"
		  render :new
	  end
  end

  def edit
	  @sponsoredPost = SponsoredPost.find(params[:id])
  end
	
  def update
	  @sponsoredPost = SponsoredPost.find(params[:id])
	  
	  if @sponsoredPost.update_attributes(params.require(:question).permit(:title, :body, :resolved))
		  flash[:notice] = "Post was updated"
		  redirect_to @question
	  else
		  flash[:error] = "Oops. you made an uh-oh. Don't screw up next time"
		  render :edit
	  end
  end
	
  def destroy
	  @question = SponsoredPost.find(params[:id])
	  
	  if @sponsoredPost.destroy
		  flash[:notice] = "Say Bye Bye to #{@sponsoredPost.title}"
		  redirect_to sponsoredPost_path
	  else
		  flash[:error] = "Oops. you made an uh-oh. Don't screw up next time"
		  render :show
	  end
   end
end
