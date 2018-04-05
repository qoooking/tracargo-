class UsersController < ApplicationController
  before_action :require_user_logged_in, only:[:index, :show]
  def index
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items.order('created_at DESC').page(params[:page])
    counts(@user)
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
  
  private
  
  #strong parameter
  def user_params
    params.require(:user).permit(:name, :email, :tell, :address, :password, :password_confirmation)
  end
end
