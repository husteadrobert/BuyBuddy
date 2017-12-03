class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:update, :edit]

  def index
    @items = Item.all #find_by(userid)
    @categories = Category.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    #TODO set List number on Item
    if @item.save
      flash[:notice] = "Item Saved"
      redirect_to list_items_path(@list)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      flash[:notice] = "Item Updated"
      redirect_to list_items_path(@list)
    else
      render 'edit'
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, category_ids: [])
    end

    def set_item
      @item = Item.find_by(slug: params[:id])
    end

end