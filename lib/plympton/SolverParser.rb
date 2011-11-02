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

# - - - - - - begin action @parser::header - - - - - -
# solver.g


	require 'bigdecimal/math'

# - - - - - - end action @parser::header - - - - - - -


module Solver
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?( :TokenData ) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens( :MOD => 8, :WHITESPACE => 18, :INT => 12, :FLOAT => 13, 
                   :MULT => 6, :MINUS => 5, :EOF => -1, :MODIFIER => 17, 
                   :LPAREN => 10, :T__19 => 19, :RPAREN => 11, :EXP => 9, 
                   :PLUS => 4, :MODVAR => 14, :DIGIT => 16, :DIV => 7, :UNMODVAR => 15 )

    # register the proper human-readable name or literal value
    # for each token type
    #
    # this is necessary because anonymous tokens, which are
    # created from literal values in the grammar, do not
    # have descriptive names
    register_names( "PLUS", "MINUS", "MULT", "DIV", "MOD", "EXP", "LPAREN", 
                    "RPAREN", "INT", "FLOAT", "MODVAR", "UNMODVAR", "DIGIT", 
                    "MODIFIER", "WHITESPACE", "'ln'" )
    
  end


  class Parser < ANTLR3::Parser
    @grammar_home = Solver

    RULE_METHODS = [ :evaluate, :expression, :mult, :log, :exp, :atom ].freeze


    include TokenData

    begin
      generated_using( "solver.g", "3.2.1-SNAPSHOT Jul 31, 2010 19:34:52", "1.8.11" )
    rescue NoMethodError => error
      # ignore
    end

    def initialize( input, options = {} )
      super( input, options )


    end

    	attr_accessor :expressionCache
    	attr_accessor :objectCache

    	# Recovery function handling errors 
    	def recover( error = $! )
    		puts "Parser Recovering: #{error}"
    		exit(1)
    	end

    	# Reporting function handling errors 
    	def report_error( error = $! )
    		puts "Parser Reporting: #{error}"
    		exit(1)
    	end

    # - - - - - - - - - - - - Rules - - - - - - - - - - - - -

    # 
    # parser rule evaluate
    # 
    # (in solver.g)
    # 57:1: evaluate returns [result] : r= expression ;
    # 
    def evaluate
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 1 )
      result = nil
      r = nil

      begin
        # at line 58:6: r= expression
        @state.following.push( TOKENS_FOLLOWING_expression_IN_evaluate_139 )
        r = expression
        @state.following.pop
        # --> action
        result = r 
        # <-- action

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 1 )

      end
      
      return result
    end


    # 
    # parser rule expression
    # 
    # (in solver.g)
    # 60:1: expression returns [result] : r= mult ( '+' r2= mult | '-' r2= mult )* ;
    # 
    def expression
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 2 )
      result = nil
      r = nil
      r2 = nil

      begin
        # at line 61:5: r= mult ( '+' r2= mult | '-' r2= mult )*
        @state.following.push( TOKENS_FOLLOWING_mult_IN_expression_160 )
        r = mult
        @state.following.pop
        # at line 62:5: ( '+' r2= mult | '-' r2= mult )*
        while true # decision 1
          alt_1 = 3
          look_1_0 = @input.peek( 1 )

          if ( look_1_0 == PLUS )
            alt_1 = 1
          elsif ( look_1_0 == MINUS )
            alt_1 = 2

          end
          case alt_1
          when 1
            # at line 62:7: '+' r2= mult
            match( PLUS, TOKENS_FOLLOWING_PLUS_IN_expression_168 )
            @state.following.push( TOKENS_FOLLOWING_mult_IN_expression_172 )
            r2 = mult
            @state.following.pop
            # --> action
             r += r2 
            # <-- action

          when 2
            # at line 63:7: '-' r2= mult
            match( MINUS, TOKENS_FOLLOWING_MINUS_IN_expression_182 )
            @state.following.push( TOKENS_FOLLOWING_mult_IN_expression_186 )
            r2 = mult
            @state.following.pop
            # --> action
             r -= r2 
            # <-- action

          else
            break # out of loop for decision 1
          end
        end # loop for decision 1
        # --> action
         result = r 
        # <-- action

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 2 )

      end
      
      return result
    end


    # 
    # parser rule mult
    # 
    # (in solver.g)
    # 67:1: mult returns [result] : r= log ( '*' r2= log | '/' r2= log )* ;
    # 
    def mult
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 3 )
      result = nil
      r = nil
      r2 = nil

      begin
        # at line 68:5: r= log ( '*' r2= log | '/' r2= log )*
        @state.following.push( TOKENS_FOLLOWING_log_IN_mult_216 )
        r = log
        @state.following.pop
        # at line 69:5: ( '*' r2= log | '/' r2= log )*
        while true # decision 2
          alt_2 = 3
          look_2_0 = @input.peek( 1 )

          if ( look_2_0 == MULT )
            alt_2 = 1
          elsif ( look_2_0 == DIV )
            alt_2 = 2

          end
          case alt_2
          when 1
            # at line 69:7: '*' r2= log
            match( MULT, TOKENS_FOLLOWING_MULT_IN_mult_224 )
            @state.following.push( TOKENS_FOLLOWING_log_IN_mult_228 )
            r2 = log
            @state.following.pop
            # --> action
             r *= r2 
            # <-- action

          when 2
            # at line 70:7: '/' r2= log
            match( DIV, TOKENS_FOLLOWING_DIV_IN_mult_238 )
            @state.following.push( TOKENS_FOLLOWING_log_IN_mult_242 )
            r2 = log
            @state.following.pop
            # --> action
             r /= r2 
            # <-- action

          else
            break # out of loop for decision 2
          end
        end # loop for decision 2
        # --> action
         result = r 
        # <-- action

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 3 )

      end
      
      return result
    end


    # 
    # parser rule log
    # 
    # (in solver.g)
    # 73:1: log returns [result] : ( 'ln' r= exp | r= exp );
    # 
    def log
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 4 )
      result = nil
      r = nil

      begin
        # at line 74:3: ( 'ln' r= exp | r= exp )
        alt_3 = 2
        look_3_0 = @input.peek( 1 )

        if ( look_3_0 == T__19 )
          alt_3 = 1
        elsif ( look_3_0 == LPAREN || look_3_0.between?( INT, UNMODVAR ) )
          alt_3 = 2
        else
          raise NoViableAlternative( "", 3, 0 )
        end
        case alt_3
        when 1
          # at line 74:5: 'ln' r= exp
          match( T__19, TOKENS_FOLLOWING_T__19_IN_log_268 )
          @state.following.push( TOKENS_FOLLOWING_exp_IN_log_272 )
          r = exp
          @state.following.pop
          # --> action
           result = BigMath.log(r, 2)
          # <-- action

        when 2
          # at line 75:5: r= exp
          @state.following.push( TOKENS_FOLLOWING_exp_IN_log_282 )
          r = exp
          @state.following.pop
          # --> action
           result = r 
          # <-- action

        end
      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 4 )

      end
      
      return result
    end


    # 
    # parser rule exp
    # 
    # (in solver.g)
    # 78:1: exp returns [result] : r= atom ( '^' r2= atom )? ;
    # 
    def exp
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 5 )
      result = nil
      r = nil
      r2 = nil

      begin
        # at line 79:5: r= atom ( '^' r2= atom )?
        @state.following.push( TOKENS_FOLLOWING_atom_IN_exp_303 )
        r = atom
        @state.following.pop
        # at line 79:12: ( '^' r2= atom )?
        alt_4 = 2
        look_4_0 = @input.peek( 1 )

        if ( look_4_0 == EXP )
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 79:14: '^' r2= atom
          match( EXP, TOKENS_FOLLOWING_EXP_IN_exp_307 )
          @state.following.push( TOKENS_FOLLOWING_atom_IN_exp_311 )
          r2 = atom
          @state.following.pop
          # --> action
           r **= r2.to_i() 
          # <-- action

        end
        # --> action
         result = r 
        # <-- action

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 5 )

      end
      
      return result
    end


    # 
    # parser rule atom
    # 
    # (in solver.g)
    # 82:1: atom returns [result] : (a= INT | a= FLOAT | LPAREN r= expression RPAREN | a= MODVAR | a= UNMODVAR ) ;
    # 
    def atom
      # -> uncomment the next line to manually enable rule tracing
      # trace_in( __method__, 6 )
      result = nil
      a = nil
      r = nil

      begin
        # at line 83:7: (a= INT | a= FLOAT | LPAREN r= expression RPAREN | a= MODVAR | a= UNMODVAR )
        # at line 83:7: (a= INT | a= FLOAT | LPAREN r= expression RPAREN | a= MODVAR | a= UNMODVAR )
        alt_5 = 5
        case look_5 = @input.peek( 1 )
        when INT then alt_5 = 1
        when FLOAT then alt_5 = 2
        when LPAREN then alt_5 = 3
        when MODVAR then alt_5 = 4
        when UNMODVAR then alt_5 = 5
        else
          raise NoViableAlternative( "", 5, 0 )
        end
        case alt_5
        when 1
          # at line 83:8: a= INT
          a = match( INT, TOKENS_FOLLOWING_INT_IN_atom_341 )
          # --> action
          result = BigDecimal(a.text)
          # <-- action

        when 2
          # at line 84:8: a= FLOAT
          a = match( FLOAT, TOKENS_FOLLOWING_FLOAT_IN_atom_356 )
          # --> action
          result = BigDecimal(a.text)
          # <-- action

        when 3
          # at line 85:8: LPAREN r= expression RPAREN
          match( LPAREN, TOKENS_FOLLOWING_LPAREN_IN_atom_367 )
          @state.following.push( TOKENS_FOLLOWING_expression_IN_atom_371 )
          r = expression
          @state.following.pop
          # --> action
           result = r 
          # <-- action
          match( RPAREN, TOKENS_FOLLOWING_RPAREN_IN_atom_375 )

        when 4
          # at line 86:8: a= MODVAR
          a = match( MODVAR, TOKENS_FOLLOWING_MODVAR_IN_atom_386 )
          # --> action

          						result = @objectCache.send(a.text)
          			
          # <-- action

        when 5
          # at line 89:8: a= UNMODVAR
          a = match( UNMODVAR, TOKENS_FOLLOWING_UNMODVAR_IN_atom_400 )
          # --> action
           
          						case a.text 
          							when 'R'
          								result = @objectCache.runtime 
          							when 'U'
          								result = @objectCache.send(a.text)
          							when 'V'
          								result = @objectCache.send(a.text)
          							else
          								result = BigDecimal("0")
          							end
          					 
          # <-- action

        end

      rescue ANTLR3::Error::RecognitionError => re
        report_error(re)
        recover(re)

      ensure
        # -> uncomment the next line to manually enable rule tracing
        # trace_out( __method__, 6 )

      end
      
      return result
    end



    TOKENS_FOLLOWING_expression_IN_evaluate_139 = Set[ 1 ]
    TOKENS_FOLLOWING_mult_IN_expression_160 = Set[ 1, 4, 5 ]
    TOKENS_FOLLOWING_PLUS_IN_expression_168 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_mult_IN_expression_172 = Set[ 1, 4, 5 ]
    TOKENS_FOLLOWING_MINUS_IN_expression_182 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_mult_IN_expression_186 = Set[ 1, 4, 5 ]
    TOKENS_FOLLOWING_log_IN_mult_216 = Set[ 1, 6, 7 ]
    TOKENS_FOLLOWING_MULT_IN_mult_224 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_log_IN_mult_228 = Set[ 1, 6, 7 ]
    TOKENS_FOLLOWING_DIV_IN_mult_238 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_log_IN_mult_242 = Set[ 1, 6, 7 ]
    TOKENS_FOLLOWING_T__19_IN_log_268 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_exp_IN_log_272 = Set[ 1 ]
    TOKENS_FOLLOWING_exp_IN_log_282 = Set[ 1 ]
    TOKENS_FOLLOWING_atom_IN_exp_303 = Set[ 1, 9 ]
    TOKENS_FOLLOWING_EXP_IN_exp_307 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_atom_IN_exp_311 = Set[ 1 ]
    TOKENS_FOLLOWING_INT_IN_atom_341 = Set[ 1 ]
    TOKENS_FOLLOWING_FLOAT_IN_atom_356 = Set[ 1 ]
    TOKENS_FOLLOWING_LPAREN_IN_atom_367 = Set[ 10, 12, 13, 14, 15, 19 ]
    TOKENS_FOLLOWING_expression_IN_atom_371 = Set[ 11 ]
    TOKENS_FOLLOWING_RPAREN_IN_atom_375 = Set[ 1 ]
    TOKENS_FOLLOWING_MODVAR_IN_atom_386 = Set[ 1 ]
    TOKENS_FOLLOWING_UNMODVAR_IN_atom_400 = Set[ 1 ]

  end # class Parser < ANTLR3::Parser

  at_exit { Parser.main( ARGV ) } if __FILE__ == $0
end

