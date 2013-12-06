require 'spec_helper'

describe "projects/create" do

  it "creates a project" do
    proj = [{:name => 'Project A', 
      :location => 'Alameda', 
      :category => 'education', 
      :organization => 'org A', 
      :blurb => 'sample blurb', 
      :nonprofit_mission => 'sample mission', 
      :description => 'sample description', 
      :deadline => '30-Nov-2013', 
      :status => 'open', 
      :budget => '1'}]
    Project.create!(proj)
    Project.stub(:find_by_id).and_return(proj)
  end
end

