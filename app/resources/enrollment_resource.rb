class EnrollmentResource < JSONAPI::Resource
  attributes :user_id, :course_id
  has_one :course
  has_one :user
end