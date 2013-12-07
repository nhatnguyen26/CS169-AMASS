require 'spec_helper'

describe Filmmaker do
  describe 'all_specialties' do
    it 'should return all specialties' do
      Filmmaker.all_specialties().should == ["Crowdfunding Video", "Documentary", "Event", "Short Film" , "Nature", "Flash Animation", "3D Animation", "Stop Motion"]
    end
  end

  describe 'all_locations' do
    it 'should return all locations' do
      Filmmaker.all_locations.should == ["Alameda", "San Francisco","San Mateo", "Santa Clara"]
    end
  end
end
