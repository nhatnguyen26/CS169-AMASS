class RemoveLocation < ActiveRecord::Migration
  def up
	remove_column :nonprofits, :location
  end

  def down
  end
end
