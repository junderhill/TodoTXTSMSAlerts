require 'clockwork'

class SMS
  def send message
    key = ENV['SMSAPI']
    api = Clockwork::API.new( key )
    message = api.messages.build(:to => message[:to], :content => message[:message])
    response = message.deliver
  end
end
