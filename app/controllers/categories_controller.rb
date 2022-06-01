class CategoriesController < ApplicationController
  def index
    @categories = Category.order('id ASC')
  end

  def show
    @category = Category.find(params[:id])
  end
end
