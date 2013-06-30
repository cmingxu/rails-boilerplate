class Admin::PagesController < ApplicationController
  def index
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
  
    respond_to do |wants|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        wants.html { redirect_to(admin_pages_path) }
        wants.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end
end
