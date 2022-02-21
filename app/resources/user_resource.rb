class UserResource < JSONAPI::Resource
  attributes :name, :user_type
  has_many :enrollments
  has_many :courses, foreign_key: "user_id"
  filter :user_type
end