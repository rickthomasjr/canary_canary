class Product < ActiveRecord::Base
  acts_as_sellable
  has_many :product_categories
  has_many :categories, through: :product_categories
  attr_accessible :code, :description, :image, :name, :price, :sale_price, :piggybak_sellable_attributes
  default_scope order('name ASC')

  def self.home_page_products
    count = self.count
    products=[]
    3.times do |n|
      products << Product.offset(rand(count)).first
    end
    products
  end
end
