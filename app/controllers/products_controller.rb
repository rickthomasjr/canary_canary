class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.search(params[:q])
  end
end
