require 'csv'

class TimetableImport    
  
  def import(import_file)
            
    t = nil        
            
    begin
      row_index = 1
      day_index = 1
      puts "*** Importing CSV file (timetable) ***"
      CSV.foreach(import_file.path) do |csv_row|        
        
        if row_index > 1                          # without header
          
          if row_index == 2                       # Timetable
            name = csv_row[0]
            year = csv_row[1]
            
            if(name != nil && year != nil)
              res = Timetable.where(:NAME => name, :YEAR => year)              
            
              if res.any?
                t = res.first
                puts "Updating existing Timetable"
                Timetable.update(t.ID, :NAME => name, :YEAR => year)
                t.NAME = name
                t.YEAR = year
              else
                puts "Creating new Timetable"
                t = Timetable.new(:NAME => name,:YEAR => year)
                t.save
              end              
                                         
            end
            
          end
          
          if row_index > 2                    # each Day                  
                
            # Day
            d = nil
            day = csv_row[2]
            puts "Importing day: "+day
            res_day = Day.where(:NAME => day, :POSITION => day_index, :TIMETABLE_ID => t.ID)
            if res_day.any?
              d = res_day.first
              puts "Updating existing day"
              Day.update(d.ID, :NAME => day, :POSITION => day_index)
              d.NAME = day
              d.POSITION = day_index
            else
              puts "Creating new day"
              d = Day.new(:NAME => day, :POSITION => day_index, :TIMETABLE_ID => t.ID)
              d.save
            end
                
            # Hours in this day
            hour_index = 3
            subject = csv_row[hour_index]
            while subject != nil
              res_subject = Subject.where(:SHORT_NAME => subject)
              if res_subject.any?
                s = res_subject.first
                res_hour = Hour.where(:DAY_ID => d.ID, :POSITION => (hour_index-2))
                if res_hour.any?
                  h = res_hour.first
                  puts "Updating existing Hour in day"
                  Hour.update(h.ID, :SUBJECT_ID => s.ID)
                  h.SUBJECT_ID = s.ID
                else                      
                  puts "Creating new Hour in day"
                  h = Hour.new(:DAY_ID => d.ID, :POSITION => (hour_index-2), :SUBJECT_ID => s.ID)
                  h.save
                end
              else
                # TODO nenalezen predmet v DB -> prerusit import (vyhodit hlasku)
              end
              hour_index += 1
              subject = csv_row[hour_index]
            end
                
            day_index += 1
          end
          
        end        
        
        row_index += 1
      end
    rescue Exception => e
      puts e
    ensure
      #CSV.close()  
    end
        
    return t
    
  end
  
end