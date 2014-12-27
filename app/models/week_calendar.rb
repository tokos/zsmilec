# encoding: utf-8

require 'date'

class WeekCalendar
  
  attr_reader :date
  attr_reader :monday
  attr_reader :tuesday
  attr_reader :wednesday
  attr_reader :thursday
  attr_reader :friday
  attr_reader :saturday
  attr_reader :sunday
  
  @@MONTHNAMES = {
      1 => 'Leden', 
      2 => 'Únor', 
      3 => 'Březen', 
      4 => 'Duben', 
      5 => 'Květen', 
      6 => 'Červen', 
      7 => 'Červenec', 
      8 => 'Srpen', 
      9 => 'Září', 
      10 => 'Říjen', 
      11 => 'Listopad', 
      12 => 'Prosinec'
      }
  
  def MONTHNAMES
    @@MONTHNAMES
  end
  
  def initialize(required_day)                       
    
    @date = required_day
    
    wday = @date.wday
    if wday == 0
      wday = 7
    end           
    
    # Monday [1]
    day_index = 1
    monday_date = Date.new(@date.year, @date.mon, @date.mday)
    monday_date = monday_date + (day_index-wday)
    @monday = DayCalendar.new(monday_date)
    
    # Tuesday [2]
    day_index = 2
    tuesday_date = Date.new(@date.year, @date.mon, @date.mday)
    tuesday_date = tuesday_date + (day_index-wday)
    @tuesday = DayCalendar.new(tuesday_date)
    
    # Wednesday [3]
    day_index = 3
    wednesday_date = Date.new(@date.year, @date.mon, @date.mday)
    wednesday_date = wednesday_date + (day_index-wday)
    @wednesday = DayCalendar.new(wednesday_date)
    
    # Thursday [4]
    day_index = 4
    thursday_date = Date.new(@date.year, @date.mon, @date.mday)
    thursday_date = thursday_date + (day_index-wday)
    @thursday = DayCalendar.new(thursday_date)
    
    # Friday [5]
    day_index = 5
    friday_date = Date.new(@date.year, @date.mon, @date.mday)
    friday_date = friday_date + (day_index-wday)
    @friday = DayCalendar.new(friday_date)
    
    # Saturday [6]
    day_index = 6
    saturday_date = Date.new(@date.year, @date.mon, @date.mday)
    saturday_date = saturday_date + (day_index-wday)
    @saturday = DayCalendar.new(saturday_date)
    
    # Sunday [0]
    day_index = 7
    sunday_date = Date.new(@date.year, @date.mon, @date.mday)
    sunday_date = sunday_date + (day_index-wday)
    @sunday = DayCalendar.new(sunday_date)

           
    @days = Hash.new        
        
  end
    
end