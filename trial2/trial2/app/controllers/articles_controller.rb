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
		@article = Article.create(article_params)

		redirect_to articles_path
	end
end
