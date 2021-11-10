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

user = User.create!(:username => "rl2912", :email => "rl2912@columbia.edu", :first_name => "Richard", :last_name => "Lopez")
workspace = Workspace.create!(:workspace_name=> "SaaS", :user => user.email, :tags => "Classes", :notes => "Engineering Software as a Service", :user_id => user.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://tesla.com/', :workspace_id => workspace.id)

user = User.create!(:username => "ks3650", :email => "ks3650@columbia.edu", :first_name => "Karen", :last_name => "Shi")
workspace = Workspace.create!(:workspace_name=> "MBC", :user => user.email, :tags => "Classes", :notes => "Making, Breaking Codes", :user_id => user.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://facebook.com/', :workspace_id => workspace.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://meta.com/', :workspace_id => workspace.id)

user = User.create!(:username => "nm3076", :email => "nm3076@columbia.edu", :first_name => "Naviya", :last_name => "Makhija")
workspace = Workspace.create!(:workspace_name=> "History Lab", :user => user.email, :tags => "Research", :notes => "NLP and Computer Vision", :user_id => user.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://messenger.com/', :workspace_id => workspace.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://gmail.com/', :workspace_id => workspace.id)

user = User.create!(:username => "jp3864", :email => "jp3864@columbia.edu", :first_name => "Jessica", :last_name => "Peng")
workspace = Workspace.create!(:workspace_name=> "Intro to Python", :user => user.email, :tags => "TA", :notes => "Scheduling and Drive", :user_id => user.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://calendar.google.com/', :workspace_id => workspace.id)
