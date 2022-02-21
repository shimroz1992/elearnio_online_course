# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	


5.times do 
	User.create!(name: Faker::Name.name,  user_type: 'author')
	User.create!(name: Faker::Name.name,  user_type: 'talent')
  Course.create!(title: 'first course',user_id: User.author.ids.sample)
end

10.times do 
	course = Course.find(Course.ids.sample)
	enrollment = course.enrollments.new(user_id: User.ids.sample)
	enrollment.save! if enrollment.valid?
end