require './lib/calc.rb'

exp1 = '1 + 2 - 3 + 6'
exp2 = '2 * 3 / 4 + 5 * 6 - 1'
exp3 = '4*5/2*8'
calc = Calculator.new()
sum1 = calc.calculate(exp1)
sum2 = calc.calculate(exp2)
sum3 = calc.calculate(exp3)

p "#{exp1} = #{sum1}"
p "#{exp2} = #{sum2}"
p "#{exp3} = #{sum3}"
