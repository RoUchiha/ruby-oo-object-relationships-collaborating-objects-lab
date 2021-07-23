
class MP3Importer

    attr_accessor :path

def initialize(path)
    @path = path
end

def files
    Dir.chdir(@path) do |path|
        Dir.glob("*.mp3")
    end
end

def import
    files.each { |song| Song.new_by_filename(song) }




end



end