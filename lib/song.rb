class Song

    attr_accessor :name, :artist
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def self.new_by_filename(file)
       artist, song = file.split(" - ")
       new_song = self.new(song)
       new_song.artist_name = artist

       return new_song
    end

    def artist_name=(artist_name)
        if Artist.find_or_create_by_name(artist_name) == false
            new_artist = Artist.new(artist_name)
            new_artist.add_song(self)
        else 
            old_artist = Artist.find_or_create_by_name(artist_name)
            old_artist.add_song(self)
        end
    end






end