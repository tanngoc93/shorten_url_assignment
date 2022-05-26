class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :urls

  before_create :generate_token

  validates :email, uniqueness: true
  validates :token, uniqueness: true, allow_blank: true

  protected

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64
  end
end
