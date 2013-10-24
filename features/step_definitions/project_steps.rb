# Add a declarative step here for populating the DB with movies.

Given /the following projects exist/ do |projects_table|
  projects_table.hashes.each do |proj|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that project to the database here.
    Project.create(proj)
  end
  # flunk "Implemented"
end
