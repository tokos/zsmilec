require 'csv'

class TimetableImport    
  
  def import(import_file)
            
    begin
      row_index = 1
      CSV.foreach(import_file.path) do |csv_row|
        timetable = Timetable.new
        if row_index == 1 # timetable name
          puts csv_row.to_s
          timetable.NAME = csv_row.to_s
        end
        
        if row_index == 2 # timetable year
          timetable.SUBJECT_ID = Subject.where("NAME", csv_row.to_s)
          puts csv_row.to_s
        end
        
        
        
        row_index += 1
      end
    rescue Exception => e
      puts e
    ensure
      #CSV.close()  
    end
    
    return Timetable.first
    
  end
  
end