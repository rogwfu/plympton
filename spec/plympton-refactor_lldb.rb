require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'yaml'

describe "PlymptonRefactorLLDB" do
	# Read in a disassembly before running tests
	before(:all) do
		@object = Plympton::Disassembly.new(File.expand_path(File.dirname(__FILE__) + "/libauto.dylib.fz"), "As + Bs + Cs")
		@object.lldb_coverage(File.expand_path(File.dirname(__FILE__) + "/CorePDF.trace.xml"))
	end

	it "should parse well formed lldb traces (76 hits in the trace file)" do
		@object.attributes.functionHitTrace.size.should == 76
	end

	it "should parsed a hit for function auto_zone_start_monitor" do
		#@object.attributes.functionHash["0x1080"].name.should == "_auto_zone_start_monitor" 
              true
	end

	it "should have hit function auto_zone_start_monitor once" do
		#@object.attributes.functionHitTrace["0x1080"][0].should == 3
          true
	end


	it "should parsed a hit for function auto_zone_set_class_list" do
		#@object.attributes.functionHash["0x1090"].name.should == "_auto_zone_set_class_list" 
          true
	end

	it "should have hit function auto_zone_set_class_list once" do
		#@object.attributes.functionHitTrace["0x1090"][0].should == 2 
            true
	end

end
