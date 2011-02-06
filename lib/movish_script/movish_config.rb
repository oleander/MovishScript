module MovishConfig
  def self.generate!(file = "lib/movish_script/config.yaml")
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
end