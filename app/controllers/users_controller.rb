class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  
  def index
    # @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @productions = current_user.productions
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    #@current_user　が使える
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_edit_params)
      flash[:success] = '編集を保存しました。'
      redirect_to @user
    else
      flash.now[:danger] = '編集の保存に失敗しました。'
      redirect_to :back
    end
  end
  
  def save_user_edit
  end
  
  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
  
  def user_edit_params
    params.require(:user).permit(:nickname, :email, :password,:realname,:postalcode,:address,:image)
  end
  
end
