class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def index
    @items = Item.where('cargo_title like ?', "%#{params[:query]}%")
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = '荷物を登録しました。'
      redirect_to root_url
    else
      @items = current_user.items.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '荷物の登録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = '荷物を削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def item_params
    params.require(:item).permit(:cargo_title)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
end
