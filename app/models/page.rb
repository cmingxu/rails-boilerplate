# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
  attr_accessible :content, :slug
end
