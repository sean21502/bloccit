class SponsoredPostsController < ApplicationController

  def show
	  @sponsoredPost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredPost = SponsoredPost.new
  end

  def create
    @sponsoredPost = SponsoredPost.new
    @sponsoredPost.title = params[:post][:title]
    @sponsoredPost.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    @sponsoredPost.topic = @topic

    if @sponsoredPost.save
      flash[:notice] = "Sponsored Post was saved."
      redirect_to [@topic, @sponsoredPost]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @sponsoredPost = SponsoredPost.find(params[:id])
  end

  def update
    @sponsoredPost = SponsoredPost.find(params[:id])
    @sponsoredPost.title = params[:sponsoredPost][:title]
    @sponsoredPost.body = params[:sponsoredPost][:body]

    if @sponsoredPost.save
      flash[:notice] = "Post was updated."
      redirect_to [@sponsoredPost.topic, @sponsoredPost]
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @sponsoredPost = SponsoredPost.find(params[:id])

    if @sponsoredPost.destroy
      flash[:notice] = "\"#{@sponsoredPost.title}\" was deleted successfully."
      redirect_to @sponsoredPost.topic
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
end
