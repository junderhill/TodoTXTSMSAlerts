require 'tasks'

describe Tasks do
  let(:tasks) {Tasks.new}
  subject {tasks.get}

  it "returns a list of tasks" do
    expect(subject.count).to be > 0
  end
  it "returns a list only containing reminder syntax" do
    
  end
end
