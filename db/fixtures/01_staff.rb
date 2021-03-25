15.times do |n|
  Staff.seed do |s|
    s.id = "#{n + 1}"
    s.name = "テスト#{n + 1}"
    s.email = "test#{n + 1}@example.com"
    s.password = "000000"
  end
end