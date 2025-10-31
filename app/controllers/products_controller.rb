class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize_seller!, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path, notice: "Product created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @product = current_user.products.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: "Product deleted successfully"
  end

  private

  def set_product
    @product = Product.find[params[:id]]
  end

  def authorize_seller!
    redirect_to root_path, alert: "Not authorized" unless @product.user == current_user
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :condition, :category_id, images: [])
  end
end
