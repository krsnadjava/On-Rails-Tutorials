class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def new
		if(user_signed_in?)
			@article = Article.new
		else
			redirect_to new_user_session_path, alert: "You're not signed in..."
		end
	end
	
	def create
		@article = current_user.articles.new(article_params)

  		if @article.save
  			redirect_to @article
  		else
  			render 'new'
  		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def edit
		if(user_signed_in?)
			if(current_user.articles.find(params[:id]).blank?)
				@article = Article.find(params[:id])
			else
				@article = current_user.articles.find(params[:id])
			end
		else
			redirect_to new_user_session_path, alert: "You're not signed in..."
		end
	end

	def update
		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
  	end

  	def destroy
  		if(user_signed_in?)
  			if(!current_user.articles.find(params[:id]).blank?)
				@article = current_user.articles.find(params[:id])

  				if @article.destroy
  					redirect_to articles_path
  				else
  					redirect_to articles_path, alert: "Failed to destroy article"
  				end
			end
		else
			redirect_to new_user_session_path, alert: "You're not signed in..."
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :text, :thumbnail)
	end

end