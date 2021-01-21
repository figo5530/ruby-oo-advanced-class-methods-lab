class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    self.new.save.last
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song  
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|s| s.name == song_name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end
    self.find_by_name(name) or self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|s|s.name}
  end

  def self.new_from_filename(name)
    file = name.split(" - ")
    artist_name = file[0]
    song_name = file[1].gsub(".mp3","")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(name)
    file = name.split(" - ")
    artist_name = file[0]
    song_name = file[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
