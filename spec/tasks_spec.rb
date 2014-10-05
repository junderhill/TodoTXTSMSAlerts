require 'tasks'

describe Tasks do
  it "returns a list of tasks" do
    tasks = Tasks.new
    items = tasks.get
    expect(items.count).to be > 0
  end
end
