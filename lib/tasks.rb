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
end
