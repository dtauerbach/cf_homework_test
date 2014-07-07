class User < ActiveRecord::Base
  has_many :campaigns
  has_many :contributions

  def self.login(email)
    user = User.find_or_create_by(email: email)
    user.login_count += 1
    user.save!
    user
  end

  def clear_logins
    self.login_count = 0
    self.save!
  end

  def update_data(email)
    self.email = email
    self.save!
  end
end
