class AddNonprofitRefToProjects < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.references :nonprofit, :index => true
    end
  end
end
