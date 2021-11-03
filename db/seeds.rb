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

workspace = Workspace.create!(:workspace_name=> "SaaS")
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://tesla.com/', :workspace_id => workspace.id)

workspace = Workspace.create!(:workspace_name => "MBC")
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://facebook.com/', :workspace_id => workspace.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://meta.com/', :workspace_id => workspace.id)

workspace = Workspace.create!(:workspace_name => "Research")
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://messenger.com/', :workspace_id => workspace.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://gmail.com/', :workspace_id => workspace.id)

workspace = Workspace.create!(:workspace_name => "TA")
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://calendar.google.com/', :workspace_id => workspace.id)
Link.create!(:workspace_name => workspace.workspace_name, :link => 'https://tesla.com/', :workspace_id => workspace.id)
