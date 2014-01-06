class Api::CountersController < Api::BaseController

  def index
    render :json => current_user.counters.all
  end

  def create
    @counter = current_user.counters.build params[:counter]
    if @counter.save
      head 200
    else
      head 403
    end
  end
end
