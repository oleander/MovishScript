require 'spec_helper'

describe MovishScript do
  it "should work" do
    lambda { 
      MovishScript.run("The.Big.Bang.Theory.S04E14.The.Thespian.Catalyst.HDTV.XviD-FQM.avi", "/Users/linus/Downloads") 
    }.should raise_error(SystemExit)
  end
end