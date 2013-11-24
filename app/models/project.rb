class Project < ActiveRecord::Base
  is_impressionable
  attr_accessible :blurb, :budget, :category, :deadline, :description, :location, :name, :nonprofit_mission, :organization, :status
  belongs_to :nonprofit
end
