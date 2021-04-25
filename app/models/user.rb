class User < ApplicationRecord
  has_many :forwards, :dependent => :destroy
  has_many :posts, through: :forwards    
  accepts_nested_attributes_for :posts
  accepts_nested_attributes_for :forwards

  
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  def first_name
     self.name.split.first
  end

  def last_name
     self.name.split.last
  end

end
