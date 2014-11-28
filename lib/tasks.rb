require 'date'
class Tasks
  def self.Tasks
  end

  def get
    tasklist = []
    todotxt = ENV['TODOTXT']
    f = File.open(todotxt, "r")
    f.each_line do |line|
      if (line =~ /{\d{8}\s\d{4}}/)
        tasklist.push(line)
      end
    end
    tasklist
  end

  def retrieve_notification_time(task)
    timesegment = task.match(/{\d{8}\s{1}\d{4}}/)[0].delete("{").delete("}")
    time = DateTime.strptime(timesegment, "%Y%m%d %H%M")
    time
  end

  def should_notify(notifytime)
    currentTime = DateTime.now
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

  def get_messages_to_send
    tasks = get()
    messages = []
    number = ENV['MOBILENO']
    tasks.each do |task|
      if(should_notify(retrieve_notification_time(task)))
         message = { :to => number, :message => "TASK: #{task}"}
         messages.push(message)
      end
    end
    messages
  end

end
