require "pry"
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
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song.name == song_name
    end
    # binding.pry
  end

  def self.find_or_create_by_name(song_name)
    checking_song = self.find_by_name(song_name)
    #binding.pry
    if checking_song == nil
      checking_song = self.create_by_name(song_name)
    end
    checking_song
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(file)
    song = file.split("-")
    artist = song[0].strip
    title = (song[1].split("."))[0].strip
    #binding.pry
    new_song = Song.new_by_name(title)
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    song = file.split("-")
    artist = song[0].strip
    title = (song[1].split("."))[0].strip
    new_song = self.create_by_name(title)
    new_song.artist_name = artist
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
