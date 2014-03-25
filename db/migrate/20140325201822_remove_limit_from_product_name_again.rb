class RemoveLimitFromProductNameAgain < ActiveRecord::Migration
	def change
		change_column :products, :name, :text
    change_column :products, :description, :text
	end
end
