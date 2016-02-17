class PagesController < ApplicationController
	def home
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
	end
	def list
		@user = User.find(params[:id])
		@articles = Article.all
	end
end