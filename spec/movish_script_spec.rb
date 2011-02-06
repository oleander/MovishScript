require 'spec_helper'

def prep!
  %x{mkdir -p /tmp/7b14e15f9d07a48e14c4ca1043f0b6a0}
end

def remove!
  %x{rm -r /tmp/7b14e15f9d07a48e14c4ca1043f0b6a0}
end

# Deactivating Growl, for now
class Growl; def notify(a,b,c); end; end

describe MovishScript do
  before(:each) do
    prep!
  end
  
  before(:all) do
    @file = "7b14e15f9d07a48e14c4ca1043f0b6a0"
    @path = "/tmp"
    @full_path = "#{@path}/#{@file}"
    @config = "/tmp/#{@file}-config"
    Struct.new('Movie', :imdb_id, :title)
    MovishConfig::generate!(@config)
  end
  
  after(:each) do
    remove!
  end
  
  it "should abort if no arguments is being passed" do
    MovishScript.run({}).should be(1)
  end
  
  it "should abort if the arguments are empty" do
    MovishScript.run({}).should be(1)
  end
  
  it "should be able to call the unpack method" do
    Unpack.should_receive(:runner!).with(@full_path).and_return([])
    MovishScript.run(:dir => @path, :file => @file).should be(2)
  end
  
  it "should pass the full absolut dir to find_by_download" do
    MovieSearcher.should_receive(:find_by_download).with(@full_path)
    MovishScript.run(:dir => @path, :file => @file).should be(2)
  end
  
  it "should abort due to an empty subtitle" do
    Unpack.should_receive(:runner!).with(@full_path).and_return([1,2,3])
    MovieSearcher.should_receive(:find_by_download).and_return(Struct::Movie.new('tt1235234', 'a title'))
    MovishScript.run(:dir => @path, :file => @file).should be(3)
  end
  
  it "should be able to read a config file" do
    growl = mock(Growl)
    Growl.should_receive(:new).and_return(growl)
    growl.should_receive(:notify).at_least(1).times
    MovishScript.run(:dir => @path, :file => @file)
  end
  
  it "should not show any growl messages due growl.global is set to false" do
    growl = mock(Growl)
    Growl.should_receive(:new).at_least(1).times.and_return(growl)
    growl.should_not_receive(:notify) # <= This is the important part
    MovishScript.config(:write => {'growl.global' => false}, :options => {:config => @config})
    MovishScript.run(:dir => @path, :file => @file, :config => @config)
  end
end