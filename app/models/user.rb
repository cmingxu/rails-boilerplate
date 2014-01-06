# -*- encoding : utf-8 -*-
require 'digest'
class User < ActiveRecord::Base
  before_save :secure_password, :on => :create
  attr_accessor :password

  validate :password_valid

  def password_valid
    self.errors.add(:password, "密码不能空") if self.password.blank?
  end

  def secure_password
    self.salt = SecureRandom.hex(10)
    self.encrypted_password = encryption_password(self.password)
  end

  def self.authenticate(u, p)
    user = User.find_by_login(u)
    user.password_valid?(p) ? user : nil
  end


  def password_valid?(password)
    encryption_password(password) == self.encrypted_password
  end

  def encryption_password(password)
    Digest::MD5.hexdigest self.salt + "shutaidong" + password
  end
end
