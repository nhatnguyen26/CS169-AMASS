class AddColumnsToNonprofits < ActiveRecord::Migration
  def change
	add_column :nonprofits, :about, :text
	add_column :nonprofits, :location, :string
	add_column :nonprofits, :links, :string
  end
end
