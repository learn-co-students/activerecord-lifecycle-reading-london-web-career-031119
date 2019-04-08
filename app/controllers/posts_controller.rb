class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = find_post
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(get_params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = find_post
	  @post.update(get_params)
	  redirect_to post_path(@post)
	end

	def edit
	  @post = find_post
	end
end

private

def find_post
	Post.find(params[:id])
end

def get_params
	params.require(:post).permit(:title, :description)
end
