require 'tasks'

describe Tasks do
  subject {Tasks.new}

  it "returns a list of tasks" do
    expect(subject.get.count).to be > 0
  end

  it "returns a list only containing reminder syntax" do
    subject.get.each do |item|
      expect(/{\d{8}\s{1}\d{4}}/.match(item))      
    end
  end

  it "returns the notification time for a task" do
    stubTask = "(A) Clean the kitchen @home {20141010 1800}"
    result = subject.retrieve_notification_time(stubTask)
    expect(result).to be_a_kind_of(Time)
  end

  it "returns a time with correct values" do
    stubTask = "(A) Tidy loung @home {20141230 1330}"
    result = subject.retrieve_notification_time(stubTask)
    expect(result.year).to eq 2014
    expect(result.month).to eq 12
    expect(result.day).to eq 30
    expect(result.hour).to eq 13
    expect(result.min).to eq 30
  end
end
