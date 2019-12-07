class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  # User Roles
  enum role: [:user, :elite, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
