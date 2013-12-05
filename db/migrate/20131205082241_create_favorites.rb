class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :filmmaker
      t.references :favorable
      t.string :favorable_type
    end
  end
end
