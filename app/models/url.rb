require 'uri'

class Url < ApplicationRecord
  belongs_to :user

  before_create :set_token

  validates :original_url, presence: true
  validates :original_url, format: { with: URI.regexp }, if: :original_url

  def open_url
    self.increment(:click_analytics, 1)
    self.save
  end

  def shorten_url(url)
    "#{url}#{self.token}"
  end

  private

  def set_token
    begin
      self.token = SecureRandom.hex[0,5].downcase
    end while self.class.exists?(token: token) 
  end
end
