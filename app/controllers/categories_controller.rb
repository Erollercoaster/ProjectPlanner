class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :update, :destroy, :edit]

  def index
    @categories = current_user.categories.all
  end

  def show
  end

  def new
    @category = current_user.categories.build
  end
  
  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'Category was successfully updated.'
    else
      render :show
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path, notice: 'Category was successfully destroyed.'
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    Rails.logger.debug(params.inspect)

    params.require(:category).permit(:name, :description)
  end
end
