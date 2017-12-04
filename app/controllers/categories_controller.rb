class CategoriesController < ApplicationController
  before_action :require_user
  before_action :set_list
  before_action :set_category, only: [:edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
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

  def destroy
    current_user.categories.delete(@category)
    redirect_back(fallback_location: root_path)
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find_by(slug: params[:id])
    end
end