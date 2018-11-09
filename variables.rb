def rails_enum_test
  # Rails 5 中，引入了 _prefix 和 _suffix 兩個選項來解決這個問題，它會給對應的 !、? 以及 scope 方法加上前/後綴以示區分
  ## user.rb
  # enum status: [:temporary, :active, :deleted], _suffix: true
  # enum admin_status: [:active, :super_admin]

  ## rails console
  # user = User.active_status.first
  # user.active_status?
  # user.deleted_status!
end

enum_test()