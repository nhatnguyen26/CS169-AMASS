class AddDetailsToNonprofits < ActiveRecord::Migration
  def change
    add_column :nonprofits, :nonprofit_category, :string
    add_column :nonprofits, :location, :string
    add_column :nonprofits, :about, :string
    add_column :nonprofits, :links, :string
  end
end
