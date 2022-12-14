# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Post.destroy_all
Comment.destroy_all

first_user = User.create!(name: 'Tom', photo: 'https://source.unsplash.com/user/c_v_r/100x100', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://source.unsplash.com/user/c_v_r/100x100', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
