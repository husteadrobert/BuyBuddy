class CategoriesController < ApplicationController
  before_action :set_list
  before_action :set_category, only: [:edit, :update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    #TODO set List number on Item
    if @category.save
      flash[:notice] = "Category Saved"
      redirect_to list_items_path(@list)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:notice] = "Category Updated"
      redirect_to list_items_path(@list)
    else
      render 'edit'
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find_by(slug: params[:id])
    end
end