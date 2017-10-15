class UsersController < ApplicationController

  before_filter :current_user, :if => :json, :except => [:login, :create, :reset_password]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # POST /users/reset_password
  def reset_password
    @user = User.find_by_email(params[:email])
    if @user
      new_password = SecureRandom.hex[0..9]
      @user.password = new_password
      @user.save!
      ::Joia::ResetPasswordEmail.new(@user.email, @user.name, new_password).send
      head 204
    else
      head 404
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    hashed = BCrypt::Engine.hash_secret(params[:password], @user.password_salt)
    if @user and @user.password_hash == hashed
      respond_to do |format|
        reset_session
        session[:user_id] = @user.id
        session[:expires_at] = Time.current + 14.days
        format.json { render json: @user }
      end
    else
      head 403
    end
  end

  # POST /users/1
  # POST /users/1.json
  def refresh 
    @user = User.find(params[:id])
    respond_to do |format|
      reset_session
      session[:user_id] = @user.id
      format.json { render json: @user }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      session[:user_id] = @user.id
      format.html # show.html.erb
      format.json { render json: @user, except: [:password_salt, :password_hash] }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user, except: [:password_salt, :password_hash] }
    end
  end

  def upload
    @user = User.find(params[:id])
    @user.image = params[:image]
    @user.save
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def groups
    @user = User.find(params[:id])
    render json: @user.groups
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(create_params)
    respond_to do |format|
      if @user.save
        reset_session
        session[:user_id] = @user.id
        session[:expires_at] = Time.current + 14.days
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, except: [:password_salt, :password_hash] }
      else
        format.html { render action: "new" }
        format.json { render json: { error: @user.errors.first.join(' ').capitalize }, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: @user, except: [:password_salt, :password_hash] }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

private
  def create_params
    params.require(:user).permit(:name, :email, :password)
  end
end
