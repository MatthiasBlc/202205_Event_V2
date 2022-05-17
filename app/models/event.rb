class Event < ApplicationRecord
  belongs_to :admin, class_name: 'User'
  has_many :attendances
  has_many :guests, through: :attendance, class_name: 'User'


  validates :start_date, presence: true, :start_is_future?
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { only_integer: true, in: 1..1000 }
  validates :location, presence: true

  def start_is_future?
    valid = self.start_date.to_i > Time.now.to_i
    errors.add(:start_date, "star must be in the future") unless valid
  end
  
  def is_modulo_5?
    valid = self.duration.to_i%5 == 0    
    errors.add(:duration, "duration must be a multiple of 5") unless valid
  end

end
