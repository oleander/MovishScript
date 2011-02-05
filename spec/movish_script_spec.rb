require 'spec_helper'

def prep!
  %x{mkdir -p /tmp/7b14e15f9d07a48e14c4ca1043f0b6a0}
end

def remove!
  %x{rm -r /tmp/7b14e15f9d07a48e14c4ca1043f0b6a0}
  %x{rm -r '/tmp/I Spit on Your Grave[2010][Unrated Edition]DvDrip[Eng]-FXG'}
end

# Deactivating Growl, for now
class Growl; def notify(a,b,c); end; end

describe MovishScript do
  before(:all) do
    prep!
    @file = "7b14e15f9d07a48e14c4ca1043f0b6a0"
    @path = "/tmp"
    @full_path = "#{@path}/#{@file}"
    Struct.new('Movie', :imdb_id, :title)
  end
  
  after(:all) do
    remove!
  end
  
  it "should abort if no arguments is being passed" do
    MovishScript.run(nil, nil).should be(1)
  end
  
  it "should abort if the arguments are empty" do
    MovishScript.run("", "").should be(1)
  end
  
  it "should be able to call the unpack method" do
    Unpack.should_receive(:runner!).with(@full_path).and_return([])
    MovishScript.run(@path, @file).should be(2)
  end
  
  it "should pass the full absolut dir to find_by_download" do
    MovieSearcher.should_receive(:find_by_download).with(@full_path)
    MovishScript.run(@path, @file).should be(2)
  end
  
  it "should abort due to an empty subtitle" do
    Unpack.should_receive(:runner!).with(@full_path).and_return([1,2,3])
    MovieSearcher.should_receive(:find_by_download).and_return(Struct::Movie.new('tt1235234', 'a title'))
    MovishScript.run(@path, @file).should be(3)
  end
  
  it "should pass the right info to Undertexter" do
    %x{mkdir '/tmp/I Spit on Your Grave[2010][Unrated Edition]DvDrip[Eng]-FXG'}
    Unpack.should_receive(:runner!).with('/tmp/I Spit on Your Grave[2010][Unrated Edition]DvDrip[Eng]-FXG').and_return([1,2,3])
    MovieSearcher.should_receive(:find_by_download).and_return(Struct::Movie.new('tt1242432', 'a title'))
    MovishScript.run(@path, 'I Spit on Your Grave[2010][Unrated Edition]DvDrip[Eng]-FXG').should_not be(3)
  end
end