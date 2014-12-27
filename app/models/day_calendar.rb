# encoding: utf-8

require 'date'

class DayCalendar
  attr_reader :events
  attr_reader :date      
  
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
  
  def is_holiday?        
    @holiday
  end
  
  def is_public_holiday?
    @public_holiday
  end
  
  def initialize(date)
    @date = date       
    @events = Event.where(:EVENT_DATE => date)
    @public_holiday = false
    @holiday = false
    
    Holiday.all.each do |holiday|
      if ((((holiday.DATE_FROM <=> date) == -1) || ((holiday.DATE_FROM <=> date) == 0)) && (((holiday.DATE_TO <=> date) == 0) || ((holiday.DATE_TO <=> date) == 1)))
        
        event = Event.new
        event.EVENT_DATE = date
        event.EVENT_TIME = Time.local(date.year, date.mon, date.mday, 8)
        event.TEXT = holiday.NAME + ' prázdniny'
        event.TYPE = 'EVT'        
        @events << event
        
        @holiday = true        
      end  
    end
    
    index = 0;
    @@PUBLIC_HOLIDAYS.keys.each do |key|
      index = index + 1
      splitted = key.split('.')
      d = splitted[0].to_i
      m = splitted[1].to_i
      
      if (d == date.mday && m == date.mon)
        event = Event.new        
        event.EVENT_DATE = date
        event.EVENT_TIME = Time.local(date.year, date.mon, date.mday, 8)
        event.TEXT = 'Státní svátek'
        event.TYPE = 'EVT'
        event.DESCRIPTION = @@PUBLIC_HOLIDAYS[key]
        @events << event
        
        @public_holiday = true
      end
        
    end
          
  end
end