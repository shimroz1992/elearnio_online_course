class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validate :validate_record, :check_for_author
  
  def validate_record
    return unless Enrollment.where("user_id = ? AND course_id = ?", user_id, course_id).exists?
    errors.add(:base, "Record already exists")
  end  

  def check_for_author
    return unless course.author == user
    errors.add(:base, "User can not be client of his own course")
  end
end

