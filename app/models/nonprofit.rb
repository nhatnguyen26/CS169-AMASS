class Nonprofit < ActiveRecord::Base
    has_one :user, :as => :profilable, :autosave => true
    has_many :projects, dependent: :destroy
end
