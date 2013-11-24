class Project < ActiveRecord::Base
  is_impressionable
  attr_accessible :blurb, :budget, :category, :deadline, :description, :location, :name, :nonprofit_mission, :organization, :status
  
  validates_presence_of :blurb, :budget, :category, :deadline, :description, :location, :name, :nonprofit_mission, :organization, :status
  validates :budget, :numericality => { :greater_than_or_equal_to => 0 } 
  belongs_to :nonprofit
end
