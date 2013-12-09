class AddFeaturedToProject < ActiveRecord::Migration
  def change
    add_column :projects, :featured, :string, :default => 'false'
  end
end
