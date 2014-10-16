shared_examples 'a timestamped resource' do
  describe '.timestamp' do
    let(:timestamp) { subject.timestamp }
    let(:time) { Time.utc(2014, 07, 9, 5) }
    let(:diff) { 0 }

    before :each do
      allow(Time).to receive(:now) { time }
      allow(subject).to receive(:created_at) { time - diff }
    end

    context 'when resource was created 20 seconds ago' do
      let(:diff) { 20.seconds }
      it do
        expect(timestamp).to eq('just now')
      end
    end

    context 'when resource was created 2 minutes ago' do
      let(:diff) { 2.minutes }
      it do
        expect(timestamp).to eq('2 minutes ago')
      end
    end

    context 'when resource was created 1 minute ago' do
      let(:diff) { 1.minutes }
      it do
        expect(timestamp).to eq('1 minute ago')
      end
    end

    context 'when resource was created 5 hours ago' do
      let(:diff) { 5.hours }
      it do
        expect(timestamp).to eq('5 hours ago')
      end
    end

    context 'when resource was created yesterday' do
      let(:diff) { 1.day }
      it 'is a date without year' do
        expect(timestamp).to eq('July 8')
      end
    end

    context 'when resource was over a year ago' do
      let(:diff) { 1.year + 50.days }
      it 'is a date with year' do
        expect(timestamp).to eq('May 20 2013')
      end
    end
  end
end
