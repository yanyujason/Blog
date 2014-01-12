class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_index_path
    else
      render template: "posts/new"
    end
    #redirect_to action: :show, id: @post.id

    #render text: params[:post].inspect
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new

  end


  private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end