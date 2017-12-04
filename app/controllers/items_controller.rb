class ItemsController < ApplicationController
  before_action :require_user
  before_action :set_list
  before_action :set_item, only: [:update, :edit, :destroy]

  def index
    # @items = Item.all
    # @categories = Category.all
    @items = current_user.items.all
    @categories = current_user.categories.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "Item Saved"
      #current_user.items << @item
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

  def destroy
    current_user.items.delete(@item)
    redirect_back(fallback_location: root_path)
  end

  private
    def item_params
      params.require(:item).permit(:name, category_ids: [])
    end

    def set_item
      @item = Item.find_by(slug: params[:id])
    end

end