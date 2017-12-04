class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
  end


  def toggleItem
    @list = List.find(params[:id])
    @item = Item.find_by(slug: params[:item_id])
    if @list.items.find_by(slug: params[:item_id]).blank?
      @list.items << @item
    else
      @list.items.delete(@item)
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  def clearAll
    @list = List.find(params[:id])
    @list.items.delete_all
    redirect_to list_items_path(@list)
  end
end