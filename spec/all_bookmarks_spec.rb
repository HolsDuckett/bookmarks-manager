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

  describe '.delete' do
    it 'can delete bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmarks = Bookmarks.create('https://skribbl.io/', 'Skribbl.io')
      bookmarks = Bookmarks.delete('https://skribbl.io/', 'Skribbl.io')
      bookmarks = Bookmarks.all
      expect(bookmarks).not_to include ["https://skribbl.io/", "Skribbl.io"]
    end
  end

  describe '.update' do
    it 'can update bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmarks = Bookmarks.create('https://skribbl.io/', 'Skribbl.io')
      bookmarks = Bookmarks.update('Skribbl.io', 'Skribbl.io 2.0')
      bookmarks = Bookmarks.all
      expect(bookmarks).to include ['https://skribbl.io/', 'Skribbl.io 2.0']
      expect(bookmarks).not_to include ['https://skribbl.io/',"Skribbl.io"]
    end
  end


end
