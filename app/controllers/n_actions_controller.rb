# encoding: utf-8

require 'date'

class NActionsController < ApplicationController
  
  layout "application"   
  
  @@PUBLIC_HOLIDAYS = {  
      '1.1.' => 'Den obnovy samostatného českého státu (Nový rok)',
      '1.5.' => 'Svátek práce', 
      '8.5.' => 'Den vítězství', 
      '5.7.' => 'Den slovanských věrozvěstů Cyrila a Metoděje', 
      '6.7.' => 'Den upálení mistra Jana Husa', 
      '28.9.' => 'Den české státnosti', 
      '28.10.' => 'Den vzniku samostatného československého státu', 
      '17.11.' => 'Den boje za svobodu a demokracii',       
      '24.12.' => 'Štědrý den', 
      '25.12.' => '1. svátek vánoční (Boží hod)', 
      '26.12.' => '2. svátek vánoční (Štěpán)'
  }
  
  def index               
    
    @object = Monthly.new
    @object.monthly = false        
    
    @week = WeekCalendar.new(Date.today)
    
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
  
  def calendar                
    
    # Get actual date and construct week calendar    
    
    @week = WeekCalendar.new(Date.today)    
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def week_back
    
    date = Date.parse(params[:d]) - 7        
    
    @week = WeekCalendar.new(date)
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def week_forward
    
    date = Date.parse(params[:d]) + 7
    
    @week = WeekCalendar.new(date)
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
  def go_to_date        
    
    date = Date.parse(params[:godate])
    
    @week = WeekCalendar.new(date)    
    
    respond_to do | format |  
        format.html # go_to_date.html.erb   
    end
  end
  
  def event_info
    
    if(params[:event_id] != nil)
      event = Event.find(params[:event_id])
      if( event != nil)
        @description = event.DESCRIPTION
      end
    else
      day = params[:day]      
      @description = @@PUBLIC_HOLIDAYS[day]
    end                  
    
    respond_to do | format |  
        format.js {render :layout => false}  
    end
  end
  
end