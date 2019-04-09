class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params_post)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(params_post)
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private
	def params_post
		params.require(:post).permit(:title, :description)
	end

end