class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path
    else
      redirect_to new_posts_path
    end
  end

  def show
    @post = Post.find_by(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new

  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def update
    @post = Post.find_by(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to posts_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.destroy

    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end