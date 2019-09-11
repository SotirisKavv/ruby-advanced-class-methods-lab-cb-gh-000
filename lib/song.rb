class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create(name, artist_name)
    song = self.new
    song.name = name
    song.artist_name = artist_name
    self.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    self.new_by_name(name).save
    song
  end

  def save
    self.class.all << self
  end

end
