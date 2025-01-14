class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    toFind = self.new_by_name(name)
    self.all.each do |song|
      if toFind.name == song.name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
      song = self.find_by_name(name)
    if !song
      self.create_by_name(name)
    else
      song
    end
  end

  def self.alphabetical
    self.all.sort do |a, b|
      a.name <=> b.name
    end
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")
    newSong = self.new
    newSong.artist_name = song[0]
    newSong.name = song[1][0, song[1].length-4]
    newSong
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
