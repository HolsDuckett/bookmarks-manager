describe Bookmarks do
  describe '#all' do
    it 'returns all the bookmarks' do
      expect(subject.all). to eq (Bookmarks::BOOKMARKS)
    end
  end
end
