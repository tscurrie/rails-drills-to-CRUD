class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		render :index
	end

	def new 
		@article = Article.new
		render :new
	end

	def create
		article_params = params.require(:article).permit(:title, :content)
		article = Article.new(article_params)
		if article.save
			redirect_to articles_path(article)
		end
	end

	def show
		article_id = params[:id]
		@article = Article.find_by_id(article_id)

		render :show
	end

	def edit
		article_id = params[:id]
		@article = Article.find_by_id(article_id)
		render :edit

	end

	def update
		article_id = params[:id]
		article = Article.find_by_id(article_id)
		article_params = params.require(:article).permit(:title, :content)
		article.update_attributes(article_params)
		redirect_to article_path(article)
	end

	def destroy
		article_id = params[:id]
		article = Article.find_by_id(article_id)
		article.destroy
		redirect_to articles_path
	end

end
