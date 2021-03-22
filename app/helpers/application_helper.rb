module ApplicationHelper

  def year_to_month(year)
    year * 12 if year
  end

  def month_cost(cost, year)
    return nil if year < 1
    (cost / year_to_month(year)).round
  end

end
