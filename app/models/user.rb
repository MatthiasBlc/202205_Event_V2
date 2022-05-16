class User < ApplicationRecord
  has_many :events, through: :attendance, foreign_key: 'admin_id', class_name: 'Event'
  has_many :attendances, foreign_key: 'guest_id', class_name: 'Attendance'

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
