class LogParser
  
  #Parse production log into table LOGS for some reporting after
  def parse_production_log        
    
    f = File.open( 'log/production.log' ).each do |line|      
      if(line.start_with?('Started GET') && line.split('"')[1].start_with?('/n_'))   # only normal view controllers
        log = Log.new
        log.CONTROLLER = line.split('"')[1]
        log.IP_ADDRESS = line.split('for ')[1].split('at')[0]
        log.LOG_TIME = DateTime.strptime(line.split('at ')[1].split(' +')[0], '%Y-%m-%d %H:%M:%S')      # 2013-12-23 19:17:20
        log.save       
      end
    end
    
    f.close
    
  end
  
end