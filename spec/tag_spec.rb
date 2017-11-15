require './models/tag'

describe Tag do

  let(:tag) { described_class.new }

  describe 'tag' do
    it 'should exist' do
      expect(tag).to be_an_instance_of(Tag)
    end
  end
end
#
#     it 'should add a tag' do
#       expect{ Link.create(name: 'B', url: 'www.b.com') }.to change { Link.all.length }.by(1)
#     end
#   end
# end
