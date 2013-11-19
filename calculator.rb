class Calculator
  attr_accessor :firstnum, :secondnum, :result, :action, :cancalc

  def initialize
    @firstnum = 1
    @secondnum = 2
    @action = "+"
    @name = "Dave"
    puts "What is your name?"
    @name = gets.chomp
    puts "Ready to calculate whenever you are, #{@name}."#should iterate over
    calculate
  end

  def calculate

    @input = gets.chomp.downcase
    while @input != "quit"
      splitit
      isfloat 
      mathify
      printresult
      calculate
    end
  end

  def mathify
    if @action == '+' || @action == "plus"
      @action = "+"
      @result = @firstnum + @secondnum
    elsif @action == '-' || @action == "minus"
      @action = "-"
      @result = @firstnum - @secondnum
    elsif @action == '*' || @action == "times"
      @action = "*"
      @result = @firstnum * @secondnum
    elsif @action == '/' || @action == "dividedby"
      @action = "/"
      @result = @firstnum / @secondnum
    elsif @action == '**' || @action == "tothepowerof"
      @action = "**"
      @result = @firstnum ** @secondnum
    elsif @action == "sqrt" || @action == "squareroot"
      @action = "sqrt"
      @result = Math.sqrt(@secondnum)
    else
      puts "I don't know how to do that, #{@name}."
    end
  end


  def splitit
    astring = @input.split.join('')
    firstnumber = ""
    secondnumber = ""

    numswitch = true
    actiondig = ''

    astring.each_char do |digit|

      if digit != "0"
        if digit ==digit.to_i.to_s || digit == "."
          if numswitch
            firstnumber << digit
          else
            secondnumber << digit
          end
        else
          actiondig << digit
          numswitch = false
        end
      end
    end
    @action = actiondig
    @secondnum = secondnumber.to_f
    if !firstnumber.empty?
      @firstnum = firstnumber.to_f
    end

  end

  def isfloat
    if @firstnum.to_f == @firstnum.to_i
      @firstnum = @firstnum.to_i
    end
    if @secondnum.to_f == @secondnum.to_i
      @secondnum = @secondnum.to_i
    end
  end

  def printresult
    if @action == 'sqrt'
      puts "The square root of #{@secondnum} is #{@result}"
    else
      puts "#{@firstnum} #{@action} #{@secondnum} = #{@result}"
    end
    @firstnum = @result
  end
end

calc = Calculator.new