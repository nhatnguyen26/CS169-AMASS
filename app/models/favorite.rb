class Favorite < ActiveRecord::Base
  belongs_to :filmmkaer
  belongs_to :favorable, :polymorphic => true
  attr_accessible :filmmaker, :favorable
end
