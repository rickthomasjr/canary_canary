class RemoveLimitFromProductDescription < ActiveRecord::Migration
  def change
  	change_column :products, :description, :string, :limit => nil
  end
end
