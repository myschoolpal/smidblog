class ArticlesController < ApplicationController
	
	before_action :set_article, only: [:edit, :show, :destroy]	

	def index
		@articles = Article.all
	end
	
	def new
		@article = Article.new
	end
	
	def edit
	end
	
	def create
		time_stamp = Time.now.to_i.to_s
		file_name = params[:article][:image]
		 File.open(Rails.root.join('public', file_name.original_filename), 'wb') do |file|
		   file.write(file_name.read)
		end
		s3 = Aws::S3::Resource.new
		bucket = s3.bucket('smidblog-images')
		object = bucket.object(file_name.original_filename+time_stamp).upload_file('public/'+file_name.original_filename) 
		@article = Article.new(article_params)
		@article.image = file_name.original_filename+time_stamp
		@article.user = current_user
		if @article.save
			flash[:success] = "Article was successfully created"
			redirect_to articles_path
		else
			render 'new'
		end
	end
	
	def update
		@article = Article.find(params[:id])
		time_stamp = Time.now.to_i.to_s
		file_name = params[:article][:image]
		if file_name 
			File.open(Rails.root.join('public', file_name.original_filename), 'wb') do |file|
			   file.write(file_name.read)
			end
			s3 = Aws::S3::Resource.new
			bucket = s3.bucket('smidblog-images')
			object = bucket.object(file_name.original_filename+time_stamp).upload_file('public/'+file_name.original_filename) 
			@article.image = file_name.original_filename+time_stamp
		end 
		@article.title = params[:article][:title]
		@article.content = params[:article][:content]
		if  @article.save
				flash[:success] = "Article was successfully updated"
				redirect_to articles_path
		else
			render 'edit'
		end
	end
	
	def show
	end
	
	def destroy
		@article.destroy
		flash[:danger] = "Article was successfully deleted"
		redirect_to articles_path
	end

	def list
		@user = User.find(params[:id])
		@articles = Article.all
	end

	private
	
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :content, :image)
	end

	
end