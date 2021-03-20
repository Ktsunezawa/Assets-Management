module ApplicationHelper

 def year_to_month(year)
   year*12 if year
 end

 def month_cost(cost,year)
  return nil if year < 1
  (cost/year_to_month(year)).round
 end

 def total_cost(totals)
   cost = 0
   totals.each do |total|
     cost += month_cost(total)
   end
   return cost
 end
end
