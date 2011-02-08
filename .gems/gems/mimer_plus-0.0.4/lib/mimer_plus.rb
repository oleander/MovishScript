# Mimer find a file's mime-type using unix' `file` command. It will never 
# look at a file's extension.
#
# Basic usage:
# 
#    mimer = Mimer.identify('/tmp/testfile')
#    => #<Mimer:0x9f @filename="/tmp/testfile", @mime_type="image/jpeg; charset=binary">
#    
#    mimer.mime_type
#    => "image/jpeg; charset=binary"
#
#    mimer.text?
#    => false
#
#    mimer.image?
#    => true
#
class Mimer
  attr_accessor :mime_type
  
  # Create a new Mimer object for the specified file.
  def self.identify(filename)
    return !File.exists?(filename) ? nil : Mimer.new(filename)
  end
  
  # Find the mime type for +filename+
  def initialize(filename)
    @filename = filename; identify!
  end
  
  # Suggests an extention to use like .jpg or .png
  def suggested_extension
    case(mime_type)
    when /^image\/jpeg/
      '.jpg'
    when /^image\/gif/
      '.gif'
    when /^image\/png/
      '.png'
    else
      nil
    end
  end
  
  # Responds to every method that ends with a question mark that isn't implemented in {Mimer}
  def method_missing(m, *args, &block)
    return !! mime_type.match(/#{m.to_s.gsub(/\?$/, '')}/i) if m.to_s.match(/\?$/)
    super(m, *args, &block)
  end
  
  private
    # Identifies the file and stores the result in +@mime_type+
    def identify!
      @mime_type = `/usr/bin/env file --brief --mime '#{@filename}'`.strip
    end
end