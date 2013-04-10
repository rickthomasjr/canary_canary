class HomeController < ApplicationController
  def index
    @products1 = Product.home_page_products
    @products2 = Product.home_page_products
    @products3 = Product.home_page_products
  end
end
