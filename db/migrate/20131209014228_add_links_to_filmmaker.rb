class AddLinksToFilmmaker < ActiveRecord::Migration
  def change
    add_column :filmmakers, :links, :string
  end
end
