require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'yaml'

describe "PlymptonRefactorLLDB" do
	# Read in a disassembly before running tests
	before(:all) do
		@object = Plympton::Disassembly.new(File.expand_path(File.dirname(__FILE__) + "/CorePDF.fz"), "As + Bs + Cs")
		@object.lldb_coverage(File.expand_path(File.dirname(__FILE__) + "/CorePDF.trace.xml"))
	end

	it "should parse well formed lldb traces (46 hits in the trace file)" do
		@object.attributes.functionHitTrace.size.should == 46 
	end

	it "should parsed a hit for function auto_zone_start_monitor" do
		@object.attributes.functionHash["0x27b8a"].name.should == "__CPFont_getFontName_" 
	end

	it "should have hit function CorePDF`-[CPFontKerning readByte] 108 times" do
		#@object.attributes.functionHitTrace["0x16e7c"][0].should == 108
	end
end
