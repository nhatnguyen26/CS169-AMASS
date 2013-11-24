# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:name => 'Project A', :location => 'Alameda', :category => 'education', :organization => 'org A', :blurb => 'sample blurb', :nonprofit_mission => 'sample mission', :description => 'sample description', :deadline => '30-Nov-2013', :status => 'open', :budget => '1'},
      {:name => 'Project B', :location => 'San Francisco',:category => 'housing', :organization => 'org B', :blurb => 'new blurb', :nonprofit_mission => 'free mission', :description => 'to describe', :deadline => '31-Dec-2014', :status => 'open', :budget => '9'},
      {:name => 'Project C', :location => 'Santa Clara', :category => 'community', :organization => 'org C', :blurb => 'blurb C', :nonprofit_mission => 'goals for C', :description => 'stuffs for C', :deadline => '31-Jan-2014', :status => 'pending', :budget => '10'},
      {:name => 'Project D', :location => 'San Mateo', :category => 'community', :organization => 'org D', :blurb => 'blurb D', :nonprofit_mission => 'goals for D', :description => 'stuffs for D', :deadline => '28-Feb-2014', :status => 'pending', :budget => '99'},
      {:name => 'Project E', :location => 'San Francisco', :category => 'education', :organization => 'org E', :blurb => 'blurb E', :nonprofit_mission => 'goals for E', :description => 'stuffs for E', :deadline => '28-Feb-2014', :status => 'pending', :budget => '100'},
      {:name => 'Project F', :location => 'Alameda',:category => 'housing', :organization => 'org F', :blurb => 'blurb F', :nonprofit_mission => 'goals for F', :description => 'stuffs for F', :deadline => '30-Apr-2014', :status => 'pending', :budget => '999'}]

projects.each do |proj|
  Project.create!(proj)
end

projects = Project.all
i = 0
days = 24 * 60 * 60
projects = projects.each{|x|
              x.created_at = x.created_at - (i * days)
              i = i + 2
              x.save!}
