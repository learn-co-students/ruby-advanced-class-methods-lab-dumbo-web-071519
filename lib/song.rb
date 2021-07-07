require 'pry'
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

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(song_name)
    new_or_old_song = self.find_by_name(song_name)
    if !new_or_old_song
      new_or_old_song = self.create_by_name(song_name)
    end
    new_or_old_song
  end

  def self.alphabetical
     @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_filename)
    split_artist = song_filename.split("-")
    #above splits artist to first element of array, song name and filetype to second part
    #below splits the songname from the filetype into the first element of a new array
    song_name = split_artist[1].split(".")[0].strip
    new_song = Song.new_by_name(song_name)
    new_song.artist_name = split_artist[0].strip
    new_song
  end
  def self.create_from_filename(song_filename)
    split_artist = song_filename.split("-")
    #above splits artist to first element of array, song name and filetype to second part
    #below splits the songname from the filetype into the first element of a new array
    song_name = split_artist[1].split(".")[0].strip
    new_song = self.create_by_name(song_name)
    new_song.artist_name = split_artist[0].strip
    new_song
  end
  def self.destroy_all
    @@all.clear
  end
end
