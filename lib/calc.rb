
class Calculator

  def calculate(exp)
    numbers, operands = parse(exp)
    return evaluate(numbers, operands)
  end


  def parse(str)
    operands = []
    numbers = []
    tmp = ""

    str.each_char do |c|
      if c == '+' || c == '-' || c == '/' || c == '*'
        unless tmp.empty?
          numbers << tmp.to_f
          tmp = ""
        end
        operands << c
      else
        tmp += c
      end
    end

    unless tmp.empty?
      numbers << tmp.to_f
      tmp = ""
    end

    return numbers, operands
  end


  def evaluate(numbers, operands)
    sum = 0
    plus_minus_op = []
    plus_minus_num = []
    last_div_mult = false
    tmp = 0

    for i in 0...operands.size()
      if operands[i] == '+' || operands[i] == '-'
        unless last_div_mult
          plus_minus_num << numbers[i]
        end
        plus_minus_op << operands[i]
        if i + 1 == operands.size()
          plus_minus_num << numbers[i+1]
        end
        last_div_mult = false
      else
        if operands[i] == '/'
          if last_div_mult
            plus_minus_num[-1] /= numbers[i+1]
          else
            plus_minus_num <<  numbers[i] / numbers[i+1]
          end
        end

        if operands[i] == '*'
          if last_div_mult
            plus_minus_num[-1] *= numbers[i+1]
          else
            plus_minus_num <<  numbers[i] * numbers[i+1]
          end
        end
        last_div_mult = true
      end
    end

    # Second pass with '+' and '-' only
    sum = plus_minus_num[0]

    for i in 0...plus_minus_op.size()
      if plus_minus_op[i] == '+'
        sum += plus_minus_num[i+1]
      end

      if plus_minus_op[i] == '-'
        sum -= plus_minus_num[i+1]
      end
    end

    return sum
  end

end
