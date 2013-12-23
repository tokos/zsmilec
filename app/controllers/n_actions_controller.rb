# encoding: utf-8

class NActionsController < ApplicationController
  
  layout "application"
  
  def index    
    
    @events = Array.new    
    
    @object = Monthly.new
    @object.monthly = false
    
    actual_date = Date.today
    Event.all.each do |event|      
      if event.EVENT_DATE.year == actual_date.year
        @events.push(event)
      end
    end
    
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