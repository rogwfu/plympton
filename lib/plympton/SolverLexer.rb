#!/usr/bin/env ruby
#
# solver.g
# --
# Generated using ANTLR version: 3.2.1-SNAPSHOT Jul 31, 2010 19:34:52
# Ruby runtime library version: 1.8.11
# Input grammar file: solver.g
# Generated at: 2011-11-02 11:29:53
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$LOAD_PATH.unshift( this_directory ) unless $LOAD_PATH.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.8.11):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?( ANTLR3 ) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?( Gem ) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '~> 1.8.11' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module Solver
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :MOD => 8, :WHITESPACE => 18, :FLOAT => 13, :INT => 12, 
                   :MULT => 6, :MINUS => 5, :EOF => -1, :MODIFIER => 17, 
                   :LPAREN => 10, :T__19 => 19, :RPAREN => 11, :EXP => 9, 
                   :PLUS => 4, :MODVAR => 14, :DIGIT => 16, :DIV => 7, :UNMODVAR => 15 )
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = Solver
    include TokenData

    
    begin
      generated_using( "solver.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end
    
    RULE_NAMES   = [ "PLUS", "MINUS", "MULT", "DIV", "MOD", "EXP", "LPAREN", 
                     "RPAREN", "T__19", "INT", "FLOAT", "MODVAR", "UNMODVAR", 
                     "WHITESPACE", "DIGIT", "MODIFIER" ].freeze
    RULE_METHODS = [ :plus!, :minus!, :mult!, :div!, :mod!, :exp!, :lparen!, 
                     :rparen!, :t__19!, :int!, :float!, :modvar!, :unmodvar!, 
                     :whitespace!, :digit!, :modifier! ].freeze

    
    def initialize( input=nil, options = {} )
      super( input, options )

    end
    
    # - - - - - - begin action @lexer::members - - - - - -
    # solver.g


    	# Recovery function handling errors 
    	def recover( error = $! )
    		puts "Lexer Recovering: #{error}"
    		exit(1)
    	end

    	# Reporting function handling errors 
    	def report_error( error = $! )
    		puts "Lexer Reporting: #{error}"
    		exit(1)
    	end

    # - - - - - - end action @lexer::members - - - - - - -

    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule plus! (PLUS)
    # (in solver.g)
    def plus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )

      type = PLUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 21:8: '+'
      match( 0x2b )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 1 )

    end

    # lexer rule minus! (MINUS)
    # (in solver.g)
    def minus!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )

      type = MINUS
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 22:9: '-'
      match( 0x2d )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 2 )

    end

    # lexer rule mult! (MULT)
    # (in solver.g)
    def mult!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )

      type = MULT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 23:8: '*'
      match( 0x2a )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 3 )

    end

    # lexer rule div! (DIV)
    # (in solver.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 24:7: '/'
      match( 0x2f )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 4 )

    end

    # lexer rule mod! (MOD)
    # (in solver.g)
    def mod!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )

      type = MOD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 25:7: '%'
      match( 0x25 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 5 )

    end

    # lexer rule exp! (EXP)
    # (in solver.g)
    def exp!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )

      type = EXP
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 26:7: '^'
      match( 0x5e )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 6 )

    end

    # lexer rule lparen! (LPAREN)
    # (in solver.g)
    def lparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 7 )

      type = LPAREN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 27:10: '('
      match( 0x28 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 7 )

    end

    # lexer rule rparen! (RPAREN)
    # (in solver.g)
    def rparen!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 8 )

      type = RPAREN
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 28:10: ')'
      match( 0x29 )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 8 )

    end

    # lexer rule t__19! (T__19)
    # (in solver.g)
    def t__19!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 9 )

      type = T__19
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 29:9: 'ln'
      match( "ln" )

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 9 )

    end

    # lexer rule int! (INT)
    # (in solver.g)
    def int!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 10 )

      type = INT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 107:11: ( DIGIT )+
      # at file 107:11: ( DIGIT )+
      match_count_1 = 0
      while true
        alt_1 = 2
        look_1_0 = @input.peek( 1 )

        if ( look_1_0.between?( 0x30, 0x39 ) )
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 107:12: DIGIT
          digit!

        else
          match_count_1 > 0 and break
          eee = EarlyExit(1)


          raise eee
        end
        match_count_1 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 10 )

    end

    # lexer rule float! (FLOAT)
    # (in solver.g)
    def float!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 11 )

      type = FLOAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 108:12: INT '.' INT
      int!
      match( 0x2e )
      int!

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 11 )

    end

    # lexer rule modvar! (MODVAR)
    # (in solver.g)
    def modvar!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 12 )

      type = MODVAR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 109:13: 'A' .. 'G' ( MODIFIER )
      match_range( 0x41, 0x47 )
      # at line 109:21: ( MODIFIER )
      # at line 109:22: MODIFIER
      modifier!


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 12 )

    end

    # lexer rule unmodvar! (UNMODVAR)
    # (in solver.g)
    def unmodvar!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 13 )

      type = UNMODVAR
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 110:14: ( 'R' | 'U' | 'V' )
      if @input.peek(1) == 0x52 || @input.peek( 1 ).between?( 0x55, 0x56 )
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 13 )

    end

    # lexer rule whitespace! (WHITESPACE)
    # (in solver.g)
    def whitespace!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 14 )

      type = WHITESPACE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 111:14: ( '\\t' | ' ' | '\\r' | '\\n' | '\\u000C' )+
      # at file 111:14: ( '\\t' | ' ' | '\\r' | '\\n' | '\\u000C' )+
      match_count_2 = 0
      while true
        alt_2 = 2
        look_2_0 = @input.peek( 1 )

        if ( look_2_0.between?( 0x9, 0xa ) || look_2_0.between?( 0xc, 0xd ) || look_2_0 == 0x20 )
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 
          if @input.peek( 1 ).between?( 0x9, 0xa ) || @input.peek( 1 ).between?( 0xc, 0xd ) || @input.peek(1) == 0x20
            @input.consume
          else
            mse = MismatchedSet( nil )
            recover mse
            raise mse
          end



        else
          match_count_2 > 0 and break
          eee = EarlyExit(2)


          raise eee
        end
        match_count_2 += 1
      end

      # --> action
       channel = HIDDEN; 
      # <-- action

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 14 )

    end

    # lexer rule digit! (DIGIT)
    # (in solver.g)
    def digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 15 )

      
      # - - - - main rule block - - - -
      # at line 117:18: '0' .. '9'
      match_range( 0x30, 0x39 )

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 15 )

    end

    # lexer rule modifier! (MODIFIER)
    # (in solver.g)
    def modifier!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 16 )

      
      # - - - - main rule block - - - -
      # at line 
      if @input.peek(1) == 0x61 || @input.peek(1) == 0x73
        @input.consume
      else
        mse = MismatchedSet( nil )
        recover mse
        raise mse
      end



    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out( __method__, 16 )

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( PLUS | MINUS | MULT | DIV | MOD | EXP | LPAREN | RPAREN | T__19 | INT | FLOAT | MODVAR | UNMODVAR | WHITESPACE )
      alt_3 = 14
      alt_3 = @dfa3.predict( @input )
      case alt_3
      when 1
        # at line 1:10: PLUS
        plus!

      when 2
        # at line 1:15: MINUS
        minus!

      when 3
        # at line 1:21: MULT
        mult!

      when 4
        # at line 1:26: DIV
        div!

      when 5
        # at line 1:30: MOD
        mod!

      when 6
        # at line 1:34: EXP
        exp!

      when 7
        # at line 1:38: LPAREN
        lparen!

      when 8
        # at line 1:45: RPAREN
        rparen!

      when 9
        # at line 1:52: T__19
        t__19!

      when 10
        # at line 1:58: INT
        int!

      when 11
        # at line 1:62: FLOAT
        float!

      when 12
        # at line 1:68: MODVAR
        modvar!

      when 13
        # at line 1:75: UNMODVAR
        unmodvar!

      when 14
        # at line 1:84: WHITESPACE
        whitespace!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA3 < ANTLR3::DFA
      EOT = unpack( 10, -1, 1, 14, 5, -1 )
      EOF = unpack( 16, -1 )
      MIN = unpack( 1, 9, 9, -1, 1, 46, 5, -1 )
      MAX = unpack( 1, 108, 9, -1, 1, 57, 5, -1 )
      ACCEPT = unpack( 1, -1, 1, 1, 1, 2, 1, 3, 1, 4, 1, 5, 1, 6, 1, 7, 
                       1, 8, 1, 9, 1, -1, 1, 12, 1, 13, 1, 14, 1, 10, 1, 
                       11 )
      SPECIAL = unpack( 16, -1 )
      TRANSITION = [
        unpack( 2, 13, 1, -1, 2, 13, 18, -1, 1, 13, 4, -1, 1, 5, 2, -1, 
                1, 7, 1, 8, 1, 3, 1, 1, 1, -1, 1, 2, 1, -1, 1, 4, 10, 10, 
                7, -1, 7, 11, 10, -1, 1, 12, 2, -1, 2, 12, 7, -1, 1, 6, 
                13, -1, 1, 9 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack( 1, 15, 1, -1, 10, 10 ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  ),
        unpack(  )
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 3
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( PLUS | MINUS | MULT | DIV | MOD | EXP | LPAREN | RPAREN | T__19 | INT | FLOAT | MODVAR | UNMODVAR | WHITESPACE );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa3 = DFA3.new( self, 3 )

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main( ARGV ) } if __FILE__ == $0
end

