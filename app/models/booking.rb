class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :puppy

  def start_time
  self.startdate
  end

  def end_time
    self.enddate
  end

end
