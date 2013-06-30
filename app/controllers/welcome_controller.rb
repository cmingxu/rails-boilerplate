class WelcomeController < ApplicationController
  def index
  end

  def dashboard
  end

  def about
    @page = Page.find_by_slug "about"
  end

  def team
  end
end
