class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(reader: self, magazine: magazine, price: price)
  end

  def total_subscription_price
    self.subscriptions.sum(:price)
  end

  def cancel_subscription(magazine)
    sub = Subscription.find_by(reader_id: self.id, magazine_id: magazine.id)
    sub.destroy
  end
end
