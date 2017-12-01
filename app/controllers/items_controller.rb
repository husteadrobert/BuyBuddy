class ItemsController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
    @list = List.first
  end
end