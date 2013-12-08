class AddLinksToNonprofit < ActiveRecord::Migration
  def change
	add_column :nonprofits, :links, :text
  end
end
