class AddLocationSpecialtyToFilmmakers < ActiveRecord::Migration
  def change
    add_column :filmmakers, :location, :string
    add_column :filmmakers, :specialty, :string
  end
end
