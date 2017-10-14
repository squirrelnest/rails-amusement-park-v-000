class Ride < ActiveRecord::Base

  belongs_to :user
  belongs_to :attraction

  validates_presence_of :user_id
  validates_presence_of :attraction_id
  validate :valid_height
  validate :valid_tickets

  def valid_height
    if self.user.height < self.attraction.min_height
      self.errors[:height] = "You are not tall enough to ride the #{self.attraction.name}"
    end
  end

  def valid_tickets
    if self.user.tickets < self.attraction.tickets
      self.errors[:tickets] = "You do not have enough tickets to ride the #{self.attraction.name}"
    end
  end

  def take_ride
    if self.user.tickets < self.attraction.tickets
      return "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      self.save
      return "You rode the #{attraction.name}."
    end
  end

end
