class Nonprofit < ActiveRecord::Base
    attr_accessible :about
    has_one :user, :as => :profilable, :autosave => true
    has_many :projects, dependent: :destroy
end
