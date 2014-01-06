# -*- encoding : utf-8 -*-
class Api::BaseController < BaseController

  def error_response(res = {})
    render :json => { :success => false }.merge!(res)
  end

  def success_response(res = {})
    render :json => { :success => true }.merge!(res)
  end
end
