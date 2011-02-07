require 'yaml'
module MovishConfig
  def self.file
    current = File.expand_path(File.dirname(__FILE__))
    File.join(current, "config.yaml")
  end
  
  def self.generate!(file = nil)
    file = file.nil? ? self.file : file
    
    yaml = {
      :system => {
        :active => true,
      },
      :unpack => {
        :min_files => 5,
        :depth => 2,
        :force_remove => false,
        :remove => false,
        :active => true
      },
      :growl => {
        :global => true,
        :unpack => true,
        :init => true,
        :subtitle => true,
        :movie => true
      },
      :subtitle => {
        :active => true,
        :language => :swedish
      }
    }.to_yaml
    
    open = File.new(file, 'w+')
    open.write(yaml)
    open.close
  end
  
  def self.read(file = nil)
    file = file.nil? ? self.file : file
    YAML.load(File.read(file))
  end
end