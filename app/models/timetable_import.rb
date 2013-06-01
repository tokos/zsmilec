require 'csv'

class TimetableImport    
  
  def import(import_file)
            
    t = nil        
            
    begin
      row_index = 1
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
              else
                puts "Creating new Timetable"
                t = Timetable.new(:NAME => name,:YEAR => year)
                t.save
              end              
              
              # TODO              
              
              if row_index > 2                    # each Day  
                puts csv_row[2] + ": " + csv_row[3] + " " + csv_row[4] + " " + csv_row[5] + " " + csv_row[6]
              end
                            
            end
            
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