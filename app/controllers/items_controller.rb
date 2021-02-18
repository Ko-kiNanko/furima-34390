class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new 
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: ccurrent_user.id)
  end
end
