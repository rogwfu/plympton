require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PlymptonRefactor" do
	# Read in a disassembly before running tests
	before(:all) do
		@object = Plympton::Disassembly.new(File.expand_path(File.dirname(__FILE__) + "/libauto.dylib.fz"))
	end

	it "should have the correct disassembly name (/usr/lib/libauto.dylib)" do
		@object.attributes["name"].should == "/usr/lib/libauto.dylib"
	end

	it "should have 409 functions" do
		@object.attributes["numFunctions"].should == 409 
	end
end
