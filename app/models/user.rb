class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :urls

  before_create :generate_token

  validates :email, presence: true,
                    uniqueness: { case_sensitive: true },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :token, uniqueness: true, allow_blank: true

  def refresh_token
    self.generate_token
    self.save
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless User.exists?(token: random_token)
    end
  end
end
