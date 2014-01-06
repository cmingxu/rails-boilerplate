class Counter < ActiveRecord::Base
  attr_accessible :end_at, :start_at, :times
end
