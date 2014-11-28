require_relative "lib/tasks"
require_relative "lib/sms"

tasks = Tasks.new
sms = SMS.new

messages = tasks.get_messages_to_send

messages.each do |msg|
  sms.send(msg)
end
