class Nonprofit < ActiveRecord::Base
    attr_accessible :about, :location, :links, :categories
    has_one :user, :as => :profilable, :autosave => true
    has_many :projects, dependent: :destroy
end
