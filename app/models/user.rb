class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :projects, foreign_key: 'client_id'

  after_create :default_role

  # Le scope marche. Si je mets User.admin ça me sort la liste de tous les utilisateurs qui sont admin.
  # À conserver au moins en tant qu'exemple de "scope" avec une "join table" 
  # scope :admin, -> { joins(:roles).where(roles: { role_name: 'admin' }) }

  def full_name
    first_name + ' ' + last_name
  end

  def role?(role)
    role_names.include?(role)
  end

  def role_names
    @role_names ||= self.roles.pluck(:role_name)
  end

  def role=(role)
    self.roles << Role.find_or_create_by_name(role)
  end

  private

  def default_role
  	self.roles << Role.find_by(role_name: "client")
  end

end
