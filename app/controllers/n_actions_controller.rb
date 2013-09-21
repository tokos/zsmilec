# encoding: utf-8

class NActionsController < ApplicationController
  
  layout "application"
  
  def index    
    
    @events = Array.new    
    
    @object = Monthly.new
    @object.monthly = true
    
    actual_date = Date.today
    Event.all.each do |event|      
      if event.EVENT_DATE.mon == actual_date.mon && event.EVENT_DATE.year == actual_date.year
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
  
  def monthly
    
    @events = Array.new
    @object = Monthly.new
    
    if params[:monthly][:monthly].to_s == '1'
      actual_date = Date.today
      Event.all.each do |event|
        if event.EVENT_DATE.mon == actual_date.mon && event.EVENT_DATE.year == actual_date.year
          @events.push(event)
        end
      end
    else
      @events = Array.new
      Event.all.each do |event|
        if event.EVENT_DATE.year == Date.today.year
          @events.push(event);
        end
      end
    end    

    @object.monthly = params[:monthly][:monthly]

    respond_to do |format|
      format.html # monthly.html.erb      
    end  

  end
  
end