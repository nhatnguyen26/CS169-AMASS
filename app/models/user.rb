class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable, 
		 :authentication_keys => [:username]

  acts_as_messageable :table_name => "messages", 
                      :required   => :body,                
                      :class_name => "CustomMessage",
                      :dependent  => :nullify,
                      :group_messages => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :name, :usertype, :password, 
				  :password_confirmation, :remember_me

  validates_presence_of :name, :username
  validates_uniqueness_of :username, :email, :case_sensitive => false

  belongs_to :profilable, :polymorphic => true, :dependent => :destroy
  
  def filmmaker?
     usertype == 'filmmaker'? true : false
  end

  def nonprofit?
     usertype == 'nonprofit'? true : false
  end 
end
