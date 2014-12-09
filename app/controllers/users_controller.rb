#encoding: utf-8

class UsersController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = current_user
    flash[:danger] = "You don't have rights to access this area."

    respond_to do |format|
      format.html { render :edit }
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      if signed_in?
        if @user.id != current_user.id
          format.html { redirect_to edit_user_path(@user) }
          flash[:danger] = "You don't have rights to access this area."
        end
        format.html { render :edit }
        format.json { render json: @user }
      else
        format.html { redirect_to login_path, alert: "You need to login first." }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if signed_in?
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to current_user
        flash[:danger] = "You don't have rights to access this area."
      end
    else
      redirect_to login_path, alert: "You need to login first."
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        @user.send_activation_email
        format.html { redirect_to login_path, :notice => "User created. 
                                                          Before login you need confirm your registration. Check your email." }
      else
        format.html { render :action => "new" }
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
        format.json { head :no_content }
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
      format.html { redirect_to login_url }
      format.json { head :no_content }
    end
  end

  def check_email

    if !User.where('email LIKE ?', "%#{ params[:email] }%").first.nil? 
      @message = "EMAIL ALREADY HAS BEEN TAKEN!"
      respond_to do |format|
        format.js
      end
    end
    
  end

end
