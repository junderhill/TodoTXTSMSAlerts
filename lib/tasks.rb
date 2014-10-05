class Tasks
  def self.Tasks

  end

  def get
    tasklist = []
    f = File.open("/home/jason/Dropbox/todo/todo.txt", "r")
    f.each_line do |line|
      if (line =~ /\{{8}\d{1}\s{4}\d\}/)
        tasklist.push(line)
      end
    end
    tasklist
  end
end
