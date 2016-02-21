# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create([
				{
					email: "meow@meow.com",
					password: "1234",
					password_confirmation: "1234"
				},
				{
					email: "meow2@meow.com",
					password: "1234",
					password_confirmation: "1234"
				}])
j1 = Job.create([
				{
					job_title: "First Job - Dog Wrangler",
					user_id: 1,
					qualified: 0
				},
				{
					job_title: "Second Job - Cat Wrangler",
					user_id: 1,
					qualified: 1
				}])