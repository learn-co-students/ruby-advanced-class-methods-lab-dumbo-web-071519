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
    song = self.new()
    @@all << song
    return song 
  end

  def self.new_by_name(name_arg)
    song = self.new()
    song.name = name_arg
    return song
  end

  def self.create_by_name(name_arg)
    song = self.new()
    song.name = name_arg
    @@all << song
    return song
  end

  def self.find_by_name(name_arg)
    @@all.find do |song_obj|
      song_obj.name == name_arg
    end
  end

  def self.find_or_create_by_name(name_arg)
    if(!self.find_by_name(name_arg))
      return self.create_by_name(name_arg)
    else
      return self.find_by_name(name_arg)
    end
  end

  def self.alphabetical()
    @@all.sort_by do |song_obj|
      song_obj.name
    end
  end

  def self.new_from_filename(file_ext)
    song = self.new()
    file_array = file_ext.split(" - ")
    song.name = file_array[1].chomp(".mp3")
    song.artist_name = file_array[0]

    return song
    #song.name = file_ext.split(" - ")[1].chomp(".mp3")
    #song.artist_name = 
  end

  def self.create_from_filename(file_name)
    song = self.new()
    file_array = file_name.split(" - ")
    song.name = file_array[1].chomp(".mp3")
    song.artist_name = file_array[0]
    @@all << song
    return song

  end

  def self.destroy_all()
    @@all.clear
  end



  #binding.pry


end
