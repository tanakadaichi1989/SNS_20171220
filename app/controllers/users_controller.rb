class UsersController < ApplicationController

  before_action :authenticate_user,only:[:index,:show,:edit,:update,:destoy]
  before_action :forbid_login_user,only:[:new,:create,:login_form,:login]
  before_action :ensure_correct_user,only:[:edit,:update]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts
  end

  def create
    @user = User.new(name: params[:name],email: params[:email],password: params[:password],image_name: "default.jpg")

    if @user.save
      session[:user_id] = @user.id
      redirect_to("/")
      flash[:notice] = "Welcome to our app."
    else
      @name = params[:name]
      @email = params[:email]
      @error_messages = @user.errors.full_messages
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @name = @user.name
    @email = @user.email
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.password = params[:password]

    if @user.save
      flash[:notice] = "Your infomation is edited."
      redirect_to("/")
    else
      @error_messages = @user.errors.full_messages
      @name = params[:name]
      @email = params[:email]
      render("users/edit")
    end
  end

   def destroy
    @user = User.find_by(id: params[:id])

    if @user.destroy
      flash[:notice] = "Your information is destroyed."
      redirect_to("/signup")
    end
   end

   def login_form
    @user = User.new
   end

   def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Log in succsessed."
      redirect_to("/")
    else
      flash[:notice] = "Comfirm your email or password."
      @email = params[:email]
      render("users/login_form")
    end
   end

   def logout
    session[:user_id] = nil
    flash[:notice] = "Log out successed."
    redirect_to("/login")
   end

   def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "You don't have rights edit this page."
      redirect_to("/")
    end
   end


end
