class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:username]

  validates :username, :uniqueness => true, :presence => true
  validates :username, :format => { :with =>  /^([a-z A-ZñáéíóúÑÁÉÍÓÚ[0-9]\s]+)$/, multiline: true }, :allow_blank => true
  # validates :email, :format => { :with => URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :password_confirmation, :presence => true

  def email_required?
    true
  end

  def email_changed?
    false
  end
end
