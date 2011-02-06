require 'spec_helper'

def prep!
  %x{mkdir -p /tmp/7b14e15f9d07a48e14c4ca1043f0b6a0}
end

def remove!
  %x{rm -r /tmp/7b14e15f9d07a48e14c4ca1043f0b6a0}
end

def movie
  MovieSearcher.should_receive(:find_by_download).and_return(Struct::Movie.new('tt1235234', 'a title'))
end

# How many times should growl be called?
def growl(times)
  growl = mock(Growl)
  Growl.should_receive(:new).at_least(1).times.and_return(growl)
  growl.should_receive(:notify).exactly(times).times
end

# Deactivating Growl, for now
class Growl; def notify(a,b,c); end; end
Struct.new('Movie', :imdb_id, :title)

describe MovishScript do
  before(:all) do
    @unpack = {
      :remove => false, 
      :depth => 2, 
      :min_files => 5, 
      :force_remove => false, 
      :active => true
    }
    %x{mkdir -p /tmp/iii}
  end
  
  before(:each) do
    MovishConfig::generate!
    movie
  end
  
  it "should not show any growl messages due growl.global is set to false" do
    growl(0)
    MovishScript.config(:write => {'growl.global' => false})
    MovishScript.run(:dir => "/some/dir", :file => "a file")
  end

  it "should not show a growl message when a subtitle is found" do
    growl(1)
    MovishScript.config(:write => {'growl.subtitle' => false})
    MovishScript.run(:dir => "/some/dir", :file => "a file")
  end
  
  it "should not show any growl message for movie" do
    growl(2)
    MovishScript.config(:write => {'growl.movie' => false})
    MovishScript.run(:dir => "/some/dir", :file => "a file")
  end
  
  it "should not show any growl message for unpack" do
    growl(2)
    Unpack.should_receive(:runner!).and_return([1,2,3])
    MovishScript.config(:write => {'growl.unpack' => false})
    %x{mkdir -p /tmp/aaa}
    MovishScript.run(:dir => "/tmp", :file => "aaa")
  end
  
  it "should not call runner! if the passed data isn't a dir" do
    Unpack.should_not_receive(:runner!)
    MovishScript.run(:dir => "/tmp", :file => "sdfsdfsdf")
  end
  
  it "should call runner! if the passed data is a dir" do
    Unpack.should_receive(:runner!).and_return([])
    MovishScript.run(:dir => "/tmp", :file => "iii")
  end
  
  it "should be possible to pass strange arguments to unpack" do
    Unpack.should_receive(:runner!).with("/tmp/iii", @unpack.merge(:depth => 10, :strange => false)).and_return([])
    MovishScript.config(:write => {'unpack.depth' => 10, 'unpack.strange' => false})
    MovishScript.run(:dir => "/tmp", :file => "iii")
    MovishScript.status.should include(6) # Unpack failed
  end
  
  it "should call runner! with some options" do
    Unpack.should_receive(:runner!).with("/tmp/iii", @unpack).and_return([])
    MovishScript.run(:dir => "/tmp", :file => "iii")
  end
  
  it "should subtitle call with some options" do
    Undertexter.should_receive(:find).with("tt1235234", :language => :swedish, :active => true).and_return([])
    MovishScript.run(:dir => "/tmp", :file => "iii")
  end
  
  it "should be possible to change the subtitle configs" do
    Undertexter.should_receive(:find).with("tt1235234", :language => :english, :active => true).and_return([])
    MovishScript.config(:write => {'subtitle.language' => :english})
    MovishScript.run(:dir => "/tmp", :file => "iii")
  end
  
  it "should not call subtitle if it's deactivated" do
    Undertexter.should_not_receive(:find)
    MovishScript.config(:write => {'subtitle.active' => false})
    MovishScript.run(:dir => "/tmp", :file => "iii").should_not eq(3)
  end
  
  it "should not call unpack if it's deactivated" do
    MovishScript.config(:write => {'unpack.active' => false})
    Unpack.should_not_receive(:runner!)
    MovishScript.run(:dir => "/tmp", :file => "iii")
  end
end

describe MovishScript do
  before(:each) do
    prep!
    MovishConfig::generate!
  end
  
  before(:all) do
    @file = "7b14e15f9d07a48e14c4ca1043f0b6a0"
    @path = "/tmp"
    @full_path = "#{@path}/#{@file}"
    @unpack = {:remove => false, :depth => 2, :min_files => 5, :force_remove => false, :active=>true}
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
    Unpack.should_receive(:runner!).with(@full_path, @unpack).and_return([])
    MovishScript.run(:dir => @path, :file => @file)
    MovishScript.status.should include(2)
  end
  
  it "should pass the full absolut dir to find_by_download" do
    MovieSearcher.should_receive(:find_by_download).with(@full_path)
    MovishScript.run(:dir => @path, :file => @file)
    MovishScript.status.should include(2)
  end
  
  it "should abort due to an empty subtitle" do
    movie
    Unpack.should_receive(:runner!).with(@full_path, @unpack).and_return([1,2,3])
    MovishScript.run(:dir => @path, :file => @file)
    MovishScript.status.should include(3) # Empty subtitle
    MovishScript.status.should include(5) # Unpack success 
  end
  
  it "should be able to read a config file" do
    growl(2)
    MovishScript.run(:dir => "/some/dir", :file => "a file")
  end
  
  it "should return 1 if the system is deactivated" do
    MovishScript.config(:write => {'system.active' => false})
    MovishScript.run(:dir => "/tmp", :file => "iii").should eq(1)
  end
end