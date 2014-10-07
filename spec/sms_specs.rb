
describe SMS do
  let(:mockClockworkApi){ double{"ClockworkApi"} }
  subject { SMS.new(mockClockworkApi) }
  context ".build" do
    it "should call messages.build" do
      :mockClockworkApi.should_receive(:build).once
    end
  end

end
