# encoding: utf-8

class NActionsController < ApplicationController
  
  layout "application"
  
  def index               
    
    @object = Monthly.new
    @object.monthly = false
    
    @events = Event.order(:EVENT_DATE, :EVENT_TIME)
    
    respond_to do |format|
      format.html # index.html.erb      
    end
  end
  
  def action
    
    @events = Event.order(:EVENT_DATE, :EVENT_TIME)    
    
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