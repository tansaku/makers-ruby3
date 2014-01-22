require 'debugger'

def provide_mortgage?(salary, deposit, property_value, bankrupt=false)
  return false if bankrupt
  return true if deposit/property_value.to_f >= 0.75
  loan_amount = property_value - deposit
  min_deposit = property_value < 650000 ? 0.05 : 0.2 # 20%
  max_multiplier = 5 # how many annual incomes can be borrowed
  #debugger
  deposit >= property_value * min_deposit &&
      salary * max_multiplier >= loan_amount
end


#Extend the provide_mortage?() method to require 5% deposit if the value of the property is 
#less than 650,000 and 20% if it's 650,000 or more.

raise 'failed to provide mortgage for >5% deposit when value < 650K' unless provide_mortgage? 120000, 31000, 600000
raise 'failed to reject mortgage for <5% deposit when value < 650K' if provide_mortgage? 120000, 29000, 600000
raise 'failed to provide mortgage for >20% deposit when value > 650K' unless provide_mortgage? 120000, 140000, 700000
raise 'failed to reject mortgage for <20% deposit when value > 650K' if provide_mortgage? 120000, 31000, 700000
# note we can see split into unit and acceptance tests here if we have a calculate_min_deposit method

#Extend the provide_mortgage?() method to waive the limit on the loan amount if the deposit is 
#75% or more.

raise 'failed to waive limit for >75% deposit when value < 650K' unless provide_mortgage? 1, 450000, 600000
raise 'failed to maintain limit for <75% deposit when value > 650K' if provide_mortgage? 1, 449999, 700000


#Extend the method to accept another argument, a boolean value indicating if the borrower is 
#currently bankrupt. Modify the method to never provide a mortgage to a bankrupt person.

raise 'failed to reject mortgage when borrower is bankrupt' if provide_mortgage? 120000, 31000, 600000, true
