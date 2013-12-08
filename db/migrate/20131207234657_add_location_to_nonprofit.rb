class AddLocationToNonprofit < ActiveRecord::Migration
  def change
	add_column :nonprofits, :location, :string
  end
end
