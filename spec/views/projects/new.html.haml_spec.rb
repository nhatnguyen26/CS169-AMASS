require 'spec_helper'

describe "projects/new", :type => :controller do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => 'Project A', 
      :location => 'Alameda', 
      :category => 'education', 
      :organization => 'org A', 
      :blurb => 'sample blurb', 
      :nonprofit_mission => 'sample mission', 
      :description => 'sample description', 
      :deadline => '30-Nov-2013', 
      :status => 'open', 
      :budget => '1'
    ).as_new_record)
  end

  it "renders new project form" do
    #render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_name[name=?]", "project[name]"
      assert_select "input#project_organization[name=?]", "project[organization]"
      assert_select "textarea#project_blurb[name=?]", "project[blurb]"
      assert_select "textarea#project_nonprofit_mission[name=?]", "project[nonprofit_mission]"
      assert_select "textarea#project_description[name=?]", "project[description]"
      assert_select "input#project_status[name=?]", "project[status]"
      assert_select "input#project_budget[name=?]", "project[budget]"
    end
  end
end

