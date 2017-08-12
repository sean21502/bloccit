class SponsoredPostsController < ApplicationController

  def show
	  @sponsoredPost = SponsoredPost.find(params[:id])
  end

  def new
  end

  def edit
  end
end
