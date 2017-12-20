class PostsController < ApplicationController

#before_action :authenticate_user
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
    @post = Post.new
    #@title = params[:title]
    #@content = params[:content]
  end

  def create
    @post = Post.new(title: params[:title], content: params[:content], user_id: @current_user.id)

    if @post.save
      redirect_to("/posts")
      flash[:notice] = "A new post created."
    else
      @title = params[:title]
      @content = params[:content]
      @error_messages = @post.errors.full_messages
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    @title = @post.title
    @content = @post.content
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]

    if @post.save
      flash[:notice] = "Your post is edited."
      redirect_to("/")
    else
      @error_messages = @post.errors.full_messages
      @title = @post.title
      @content = @post.content
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
    flash[:notice] = "Your post is destroyed."
    redirect_to("/")
    end
  end

end
