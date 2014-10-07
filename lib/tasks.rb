class Tasks
  def self.Tasks
  end

  def get
    tasklist = []
    f = File.open("/home/jason/Dropbox/todo/todo.txt", "r")
    f.each_line do |line|
      if (line =~ /{\d{8}\s\d{4}}/)
        tasklist.push(line)
      end
    end
    tasklist
  end

  def retrieve_notification_time(task)
    timesegment = task.match(/{\d{8}\s{1}\d{4}}/)[0].delete("{").delete("}")
    time = Time.strptime(timesegment, "%Y%m%d %H%M")
    time
  end

  def should_notify(notifytime)
    currentTime = Time.new
    if(currentTime.year != notifytime.year)
      return false
    end
    if(currentTime.month != notifytime.month)
      return false
    end
    if(currentTime.day != notifytime.day)
      return false
    end
    if(currentTime.hour != notifytime.hour)
      return false
    end
    if(currentTime.min != notifytime.min)
      return false
    else
      return true
    end
  end
end
