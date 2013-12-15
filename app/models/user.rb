class User < ActiveRecord::Base
  before_create :setup_default_role_for_new_users
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :speak
  has_many :language_speak, :through => :speak, :class_name => "Language"

  has_many :improve
  has_many :language_improve, :through => :improve, :class_name => "Language"
  has_many :hobby
  has_many :interest, :through => :hobby, :class_name => "Interest"

  has_many :appointments
  has_many :availables, :through => :appointments

  ROLES = %w[admin default ambassador banned]
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :language_speak_ids, :language_improve_ids, :country, :interest_ids, :name, :surname, :provider, :role, :sign_in_count, :available_hour_ids
  # attr_accessible :title, :body
  #

 def setup_default_role_for_new_users
    if self.role.blank?
      self.role = "default"
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.first_name
      user.surname = auth.info.last_name
      user.foto = auth.info.image
      user.country = auth.extra.raw_info.locale
    end
  end

def self.new_with_session(params, session)
  if session["devise.user_attributes"]
    new(session["devise.user_attributes"], without_protection: true) do |user|
      user.attributes = params
      user.valid?
    end
  else
    super
  end
end
def language?
  if language_improve.empty? or language_speak.empty?
    false
  else
    true
  end
end

def compatible?(user)
  if not (user.language_improve & language_speak).empty? and not (user.language_speak & language_improve).empty?
    true
  else
    false
  end
end


def admin?
  if role== "admin"
    true
  else
    false
  end
end
def default?
  if role== "default"
    true
  else
    false
  end
end

def password_required?
  super && provider.blank?
end

def compatible_users
  #users = User.where("orders_count = ? AND locked = ?", language_id, false)#retornar user amb mateix availables i mateixes llengues

end


def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end
end
