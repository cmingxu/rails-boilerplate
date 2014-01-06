# -*- encoding : utf-8 -*-
class Api::UsersController < Api::BaseController
  def register
    @user = User.new(params[:user])
    if @user.save
      success_response(:user => @user)
    else
      error_response(:message => @user.errors.first)
    end
  end

  def login
    @user = User.find_by_login params[:user][:login]
    if @user
      if @user.password_valid?(params[:user][:password])
        success_response(:user => @user)
      else
        error_response(:message => "登陆密码不正确")
      end
    else
      error_response(:message => "用户名错误")
    end
  end
end
