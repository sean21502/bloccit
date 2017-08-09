class QuestionsController < ApplicationController
  def index
	  @questions = Question.all
  end

  def show
	  @question = Question.find(params[:id])
  end

  def new
	  @question = Question.new
  end
	
  def create
	  @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
	  
	  if @question.save
		  flash[:notice] = "Question was saved"
		  redirect_to @question
	  else
		  flash[:error] = "Oops. you made an uh-oh. Don't screw up next time"
		  render :new
	  end
  end

  def edit
	  @question = Question.find(params[:id])
  end
	
  def update
	  @question = Question.find(params[:id])
	  
	  if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
		  flash[:notice] = "Question was updated"
		  redirect_to @question
	  else
		  flash[:error] = "Oops. you made an uh-oh. Don't screw up next time"
		  render :edit
	  end
  end
	
  def delete
	  @question = Question.find(params[:id])
	  
	  if @question.destroy
		  flash[:notice] = "Say Bye Bye to #{@question.title}"
		  redirect_to questions_path
	  else
		  flash[:error] = "Oops. you made an uh-oh. Don't screw up next time"
		  render :show
	  end
   end
end
