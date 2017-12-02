class ListsController < ApplicationController
  def toggleItem
    list = List.find(params[:id])
    @item = Item.find(params[:item_id])
    if list.items.find_by(id: params[:item_id]).blank?
      list.items << @item
    else
      list.items.delete(@item)
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end
end