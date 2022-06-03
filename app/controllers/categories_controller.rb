class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author_id: current_user.id).order('id DESC')
    @user = current_user
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    user = current_user
    @category = user.categories.new(category_params)
    if @category.save
      redirect_to categories_path
      flash[:success] = 'Category has been successfully added.'
    else
      render :new
      flash[:fail] = 'Unfortunately the category was not created'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
