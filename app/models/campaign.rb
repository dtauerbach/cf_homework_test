class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :contributions

  def add_contribution(amount, contributor)
    contribution = Contribution.create(campaign_id: self.id,
                                       user_id: contributor.id,
                                       amount: amount)
    self.total += amount
    self.save!
    contribution
  end

  def update_data(title, email)
    self.title = title
    self.user = User.find_or_create_by(email: email)
    self.save!
  end

  def update_total
    self.total = self.contributions.sum(:amount)
    self.save!
  end
end
