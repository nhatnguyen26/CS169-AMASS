class RemoveLinks < ActiveRecord::Migration
  def up
	remove_column :nonprofits, :links
  end

  def down
  end
end
