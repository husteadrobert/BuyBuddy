class ListsController < ApplicationController
  def toggleItem
    list = List.find(params[:id])
    @item = Item.find_by(slug: params[:item_id])
    if list.items.find_by(slug: params[:item_id]).blank?
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