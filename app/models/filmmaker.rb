class Filmmaker < ActiveRecord::Base
  attr_accessible :about, :summary, :experience, :skills, :contact, :location, :specialty, :links
  has_one :user, :as => :profilable, :autosave => true
  has_many :favorites
  has_many :favorite_projects, :through => :favorites, :source => :favorable, :source_type => "Project"

  def self.all_specialties
    return ["Crowdfunding Video", "Documentary", "Event", "Short Film" , "Nature", "Flash Animation", "3D Animation", "Stop Motion"]
  end

  def self.all_locations
    return ["Alameda", "San Francisco","San Mateo", "Santa Clara"]
  end
end
