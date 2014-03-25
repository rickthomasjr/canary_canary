class RemoveLimitFromProductName < ActiveRecord::Migration
	def change
		change_column :products, :name, :string, :limit => nil
	end
end
