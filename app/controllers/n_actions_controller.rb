# encoding: utf-8

class NActionsController < ApplicationController
  
  layout "application"
  
  def index               
    
    @object = Monthly.new
    @object.monthly = false
    
    @events = Event.all
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def action
    
    @events = Event.all
    
    @object = Monthly.new
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def holiday
    
    @holidays = Holiday.all
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
end