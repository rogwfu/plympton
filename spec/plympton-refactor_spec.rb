require 'yaml'
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "PlymptonRefactor" do
	# Read in a disassembly before running tests
	before(:all) do
		@object = Plympton::Disassembly.new("/Users/rseagle/Desktop/dissertation/plympton-refactor/spec/libauto.dylib.fz")
	end

	it "should have the correct disassembly name (/usr/lib/libauto.dylib)" do
		@object.attributes.disName.should == "/usr/lib/libauto.dylib"
	end
end
