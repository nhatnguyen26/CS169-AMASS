class AdminUser < ActiveRecord::Base
# Include default devise modules. Others available are:
# :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :rememberable, :trackable, :validatable

# Setup accessible (or protected) attributes for your model
  attr_accessor :username
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    username = conditions.delete(:username)
    where(conditions).where(["lower(email) = :value", { :value => username.downcase }]).first
  end
end

ActiveAdmin.register AdminUser do
  index do
    column :email
    column :password
    column :password_confirmation
    default_actions
  end

 form do |f|
   f.inputs "User Details" do
     f.inputs :email
     f.inputs :password
     f.inputs :password_confirmation
   end
  f.buttons
 end
end

