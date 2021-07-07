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
      song = self.new
      @@all << song
      song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(to_find)
    @@all.find {|instance| instance.name == to_find}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(filename)
   info = filename.split(" - ")
   song = self.new_by_name(info[1][0..-5])
   song.artist_name = info[0]
   song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 

  def self.destroy_all
    self.all.clear
  end

end

newsong = Song.new_from_filename("Blank Space - Taylor Swift.mp3")
