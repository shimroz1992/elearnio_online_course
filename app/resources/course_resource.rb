class CourseResource < JSONAPI::Resource
  attributes :title, :description
  has_many :enrollments
  has_many :courses
  has_one :author, class_name: "User", foreign_key: "user_id"
end
