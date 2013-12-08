class AddCategoryToNonprofit < ActiveRecord::Migration
  def change
	add_column :nonprofits, :categories, :string
  end
end
