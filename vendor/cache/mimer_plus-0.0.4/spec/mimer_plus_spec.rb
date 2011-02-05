require 'spec_helper'

describe "Mimer" do
  it "should create a new Mimer instance with identify" do
    m = Mimer.identify(fixture_path('plain.txt'))
    m.should_not be_nil
    m.should be_a(Mimer)
  end
  
  it "should return nil if the file cannot be found" do
    m = Mimer.identify(fixture_path('does_not.exist'))
    m.should be_nil
  end
  
  describe "text" do
    
    before(:each) do
      @mimer = Mimer.identify(fixture_path('plain.txt'))
    end
    
    it "should identify mime correctly" do
      @mimer.mime_type.should match(/text\/plain/)
    end
    
    it "should find this text" do
      @mimer.should be_text
    end
  end
  
  describe "image extensions" do
    it "should work for jpeg" do
      mimer = Mimer.identify(fixture_path('facepalm.jpg'))
      mimer.suggested_extension.should eql(".jpg")
    end
    
    it "should work for gif" do
      mimer = Mimer.identify(fixture_path('google.gif'))
      mimer.suggested_extension.should eql(".gif")
    end
    
    it "should work for png" do
      mimer = Mimer.identify(fixture_path('kirk.png'))
      mimer.suggested_extension.should eql(".png")
    end
  end
  
  describe "image" do
    
    before(:each) do
      @mimer = Mimer.identify(fixture_path('facepalm.jpg'))
    end
    
    it "should identify mime correctly" do
      @mimer.mime_type.should match(/image\/jpeg/)
    end
    
    it "should find this image" do
      @mimer.should be_image
    end
  end
end

describe Mimer, "should have a missing method" do
  before(:each) do
    @mimer = Mimer.identify(fixture_path('facepalm.jpg'))
  end
  
  it "should raise an exception if a method isn't implemented" do
    lambda {
      @mimer.some_strange_method
    }.should raise_error(NoMethodError)
  end
  
  it "should not raise an exception when trying to get the get the mime type" do
    lambda {
      @mimer.some_strange_mimetype?
    }.should_not raise_error(NoMethodError)
  end
end
