require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'yaml'

describe "PlymptonRefactor" do
	# Read in a disassembly before running tests
	before(:all) do
		@object = Plympton::Disassembly.new(File.expand_path(File.dirname(__FILE__) + "/libauto.dylib.fz"), "As + Ba")
	end

	it "should have the correct disassembly name (/usr/lib/libauto.dylib)" do
		@object.attributes.name.should == "/usr/lib/libauto.dylib"
	end

	it "should have 409 functions" do
		@object.attributes.numFunctions.should == 409 
	end

	it "should have the text section starting at 0xf60" do
		@object.attributes.textSegmentStart.should == "0xf60" 
	end

	it "should have the text section ending at 0x44354" do
		@object.attributes.textSegmentEnd.should == "0x44354" 
	end

	it "should not have any imports" do
		@object.attributes.numImports == 0
	end

	it "should have 15496 number of blocks" do
		@object.attributes.numBlocks == 15496	
	end

	it "should have a function hash" do
		@object.attributes.functionHash.should be_an_instance_of(Hash)
	end

	it "should have a function hash keyed on hex addresses" do
		@object.attributes.functionHash.should have_key("0x10a0") 
	end

	it "store functions in a function hash" do
		@object.attributes.functionHash["0x10a0"].should be_an_instance_of(Plympton::Function)
	end

	['A','B','C','D','E','F','G'].each do |variable|
		it "should respond to sum function #{variable}s" do
			@object.attributes.should respond_to(variable + "s") 
		end
	end

	['A','B','C','D','E','F','G'].each do |variable|
		it "should respond to average function #{variable}a" do
			@object.attributes.should respond_to(variable + "a") 
		end
	end

	it "should parse well formed valgrind rufus traces" do
		@object.valgrind_coverage(File.expand_path(File.dirname(__FILE__) + "/rufus-test.32bit.trace.xml"))
		@object.functionHitTrace.size.should == 2
	end

	it "should parsed a hit for function auto_zone_start_monitor" do
		@object.valgrind_coverage(File.expand_path(File.dirname(__FILE__) + "/rufus-test.32bit.trace.xml"))
		@object.attributes.functionHash["0x1080"].name.should == "_auto_zone_start_monitor" 
	end

	it "should have hit function auto_zone_start_monitor once" do
		@object.valgrind_coverage(File.expand_path(File.dirname(__FILE__) + "/rufus-test.32bit.trace.xml"))
		@object.functionHitTrace["0x1080"].should == 1 
	end


	it "should parsed a hit for function auto_zone_set_class_list" do
		@object.valgrind_coverage(File.expand_path(File.dirname(__FILE__) + "/rufus-test.32bit.trace.xml"))
		@object.attributes.functionHash["0x1090"].name.should == "_auto_zone_set_class_list" 
	end

	it "should have hit function auto_zone_set_class_list once" do
		@object.valgrind_coverage(File.expand_path(File.dirname(__FILE__) + "/rufus-test.32bit.trace.xml"))
		@object.functionHitTrace["0x1090"].should == 1 
	end

	it "cache an equation for the solver" do 
		@object.expression.expressionCache.should == "As + Ba"	
	end
end
