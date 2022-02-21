class User < ApplicationRecord
  enum user_type: [:author, :talent, :not_set]
  scope :authors, -> { where(user_type: 'author') }
  scope :talents, -> { where(user_type: 'talent') }
  before_destroy :check_for_author, prepend: true
  has_many :enrollments, dependent: :destroy
  has_many :courses, dependent: :destroy
  validates :name, presence: true
  validates :user_type, presence: true

  private

  def check_for_author
    if user_type == 'author'
      all_authors = User.authors.where.not(id: id)
      if all_authors.blank?
        errors[:base] << "cannot delete course no author present"
        return false
      else
        courses.update_all(user_id: all_authors.last.id)
        # need to transered the authors of all courses to another author
      end
    end
  end
end
