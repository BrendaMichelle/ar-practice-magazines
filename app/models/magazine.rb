class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    email_arr = self.readers.map { |reader_instance| reader_instance.email }
    email_arr.join(";")
  end

  def self.popular_magazines
    Magazine.all.select { |magazine_instance| magazine_instance.subscriptions.count > 3 }
  end

  def self.most_popular
    Magazine.all.max_by { |magazine_instance| magazine_instance.subscriptions.count }

    # most_pop_magazine = Magazine.first

    # Magazine.all.each do |m|
    #   if m.subscriptions.count > most_pop_magazine.subscriptions.count
    #     most_pop_magazine = m
    #   end
    # end

    # most_pop_magazine
  end
end
