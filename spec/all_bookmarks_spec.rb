describe Bookmarks do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers Academy');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'Google');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include ["http://www.makersacademy.com", 'Makers Academy']
      expect(bookmarks).to include ["http://www.google.com", 'Google']
    end
  end

  describe '.create' do
    it 'can add bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmarks = Bookmarks.create('https://skribbl.io/', 'Skribbl.io')
      bookmarks = Bookmarks.all
      expect(bookmarks).to include(["https://skribbl.io/", "Skribbl.io"])
    end
  end
end
