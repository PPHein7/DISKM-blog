class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "Successfully created post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error creating new post!"
			render :new
		end
	end

	def edit
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:notice] = "Successfully updated post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error updating post!"
			render :edit
		end
	end

	def show
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = "Successfully deleted post!"
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :author, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end