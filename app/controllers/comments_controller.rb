class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)
		if(@article.user_id == current_user.id)
			@comment.approved = 1
		else
			@comment.approved = 0
		end
		@comment.user_id = current_user.id
		@comment.save
		redirect_to article_path(@article)
	end

	def destroy
    	@article = Article.find(params[:article_id])
    	@comment = @article.comments.find(params[:id])
    	@comment.destroy
    	redirect_to article_path(@article)
  	end

  	def update
  		@article = Article.find(params[:article_id])
    	@comment = @article.comments.find(params[:id])
    	@comment.approved = 1
    	@comment.save
  		redirect_to article_path(@article)
  	end

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
		end

end
