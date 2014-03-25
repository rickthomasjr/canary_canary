task :export => :environment do 
  CSV.open("db/candy.psv", 'w', {:col_sep => "|"}) do |csv|
  	brands = ["Brach's", 'Hershey', 'Mars', 'Haribo', 'Jelly Belly']
    csv << ['ID', 'Name', 'Description', 'Brand', 'Category', 'Link', 'ImageLink', 'Price', 'SalePrice', 'Availability', 'Rating', 'ReleaseDate']
    Product.all.each do |product|
    	brand = 'Canary'
    	brands.each{|b| brand = b if product.description.include? b}
    	rating = [1,2,3,4,5].sample
      csv << [product.id, product.name.squish, product.description.squish, brand, product.categories.first.name, product.link, product.image_link, product.price, product.sale_price, 'Y', rating, Time.at(rand * Time.now.to_f).utc.to_s.gsub(' UTC', '')]
    end
  end
end