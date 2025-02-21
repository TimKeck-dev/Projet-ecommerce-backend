class User < ApplicationRecord
  has_secure_password
  has_many :orders

  def admin?
    self.admin
  end
end
