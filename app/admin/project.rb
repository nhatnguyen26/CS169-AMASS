ActiveAdmin.register Project do
  index do
    column :name, :sortable => :name do |proj|
      link_to proj.name, [:admin, proj]
    end
    column :organization
    column :category
    column :location
    column :status
    column :featured
    column :budget, :sortable => :budget do |proj|
      number_to_currency proj.budget
    end
    column :deadline
  end
end
