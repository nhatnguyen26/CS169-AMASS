ActiveAdmin.register User do
  index do
    column :name, :sortable => :name do |x|
      link_to x.name, [:admin, x]
    end
    column :username
    column :email
    column :usertype
  end
end
