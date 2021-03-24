15.times {
  Staff.seed do |s|
    n = 0
    s.id = "#{n + 1}"
    s.name = "テスト#{n + 1}"
    s.email = "test#{n + 1}@example.com"
    s.password = "000000"
end
}