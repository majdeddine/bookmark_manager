describe Tag do

  let(:tag) { described_class.new }

  describe 'tag' do
    it 'should exist' do
      expect(tag).to be_an_instance_of(Tag)
    end
  end

    it 'should add a tag' do
      expect{ Tag.create(name: 'B') }.to change { Tag.all.length }.by(1)
    end
end
