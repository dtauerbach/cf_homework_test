class Campaign < ActiveRecord::Base
  belongs_to :user
  has_many :contributions
  has_many :perks

  def add_contribution(amount, contributor)
    contribution = Contribution.create(campaign_id: self.id,
                                       user_id: contributor.id,
                                       amount: amount)
    self.total += amount
    self.save!
    contribution
  end

  def add_perk(title, text, amount)
    perk = Perk.create(title: title,
                       text: text,
                       amount: amount,
                       campaign_id: self.id)
    self.save!
    perk
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
