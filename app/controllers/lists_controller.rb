class ListsController < ApplicationController
  before_action :set_list

  def show
  end


  def toggleItem
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
    @list.items.delete_all
    redirect_to list_items_path(@list)
  end
end