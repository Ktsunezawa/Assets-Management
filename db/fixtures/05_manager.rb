Manager.seed_once(:id) do |s|
  s.id = "1"
  s.email = ENV['manager_email'],
  s.password = ENV['manager_password']
end