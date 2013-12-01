ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    #div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #  span :class => "blank_slate" do
    #    span I18n.t("active_admin.dashboard_welcome.welcome")
    #    small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #  end
    #end

    section "Recent Projects" do
      table_for Project.order("created_at desc").limit(3) do
        column :name do |proj|
          link_to proj.name, [:admin, proj]
        end
        column :created_at
      end
      strong { link_to "View All Projects", admin_projects_path}
    end
    
    section "Recent Users" do
      table_for User.order("created_at desc").limit(3) do
        column :name do |x|
          link_to x.name, [:admin, x]
        end
        column :usertype
        column :created_at
      end
      strong { link_to "View All Users", admin_users_path}
    end


    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content



end
