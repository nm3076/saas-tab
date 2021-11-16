# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# Workspace.destroy_all
# Link.destroy_all

# # Workspace.connection

user1 = User.create!(:username => "rl2912", :email => "rl2912@columbia.edu", :first_name => "Richard", :last_name => "Lopez", password: "foobar", password_confirmation: "foobar")
user2 = User.create!(:username => "ks3650", :email => "ks3650@columbia.edu", :first_name => "Karen", :last_name => "Shi", password: "foobar", password_confirmation: "foobar")
user3 = User.create!(:username => "nm3076", :email => "nm3076@columbia.edu", :first_name => "Naviya", :last_name => "Makhija", password: "foobar", password_confirmation: "foobar")
user4 = User.create!(:username => "jp3864", :email => "jp3864@columbia.edu", :first_name => "Jessica", :last_name => "Peng", password: "foobar", password_confirmation: "foobar")
user5 = User.create!(:username => "bs1212", :email => "bs1212@columbia.edu", :first_name => "Bob", :last_name => "Smith", password: "foobar", password_confirmation: "foobar")
user6 = User.create!(:username => "ms6174", :email => "ms6174@columbia.edu", :first_name => "Mary", :last_name => "Smith", password: "foobar", password_confirmation: "foobar")

workspace1 = Workspace.create!(:workspace_name=> "SaaS", :user => user1.email, :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => user1.id)
workspace2 = Workspace.create!(:workspace_name=> "MBC", :user => user2.email, :tags => "Classes", :notes => "Making, Breaking Codes", :user_id => user2.id)
workspace3 = Workspace.create!(:workspace_name=> "History Lab", :user => user3.email, :tags => "Research", :notes => "NLP and Computer Vision", :user_id => user3.id)
workspace4 = Workspace.create!(:workspace_name=> "Intro to Python", :user => user4.email, :tags => "TA", :notes => "Scheduling and Drive", :user_id => user4.id)
workspace5 = Workspace.create!(:workspace_name=> "Colonial Cities", :user => user3.email, :tags => "Classes", :notes => "Colonial Cities of the Americas", :user_id => user3.id)

Link.create!(:workspace_name => workspace1.workspace_name, :link => 'https://tesla.com/', :workspace_id => workspace1.id)

Link.create!(:workspace_name => workspace2.workspace_name, :link => 'https://facebook.com/', :workspace_id => workspace2.id)
Link.create!(:workspace_name => workspace2.workspace_name, :link => 'https://meta.com/', :workspace_id => workspace2.id)

Link.create!(:workspace_name => workspace3.workspace_name, :link => 'https://messenger.com/', :workspace_id => workspace3.id)
Link.create!(:workspace_name => workspace3.workspace_name, :link => 'https://gmail.com/', :workspace_id => workspace3.id)

Link.create!(:workspace_name => workspace4.workspace_name, :link => 'https://calendar.google.com/', :workspace_id => workspace4.id)

Link.create!(:workspace_name => workspace5.workspace_name, :link => 'https://maps.google.com/', :workspace_id => workspace5.id)
Link.create!(:workspace_name => workspace5.workspace_name, :link => 'http://coursera.org/', :workspace_id => workspace5.id)

Collaborator.create!(:user_id => user1.id, :workspace_id => workspace1.id, :collaborator_name => user2.username, :owner_name => user1.username)
Collaborator.create!(:user_id => user1.id, :workspace_id => workspace1.id, :collaborator_name => user3.username, :owner_name => user1.username)

Collaborator.create!(:user_id => user3.id, :workspace_id => workspace3.id, :collaborator_name => user4.username, :owner_name => user3.username)
