# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Workspace.destroy_all
Link.destroy_all

Workspace.connection

workspaces = [{ :workspace_name => 'SaaS' }, { :workspace_name => 'MBC' }]

workspaces.each do |workspace|
    Workspace.create!(workspace)
end

#workspaces.each_with_index do |obj, index|
#    Link.create!([{:workspace_name => 'class #{index}', :link => 'google.com', :workspace_id => obj.id }])
#end

links = [{ :workspace_name => 'SaaS', :link => 'google.com' }, { :workspace_name => 'MBC', :link => 'meta.com' }, { :workspace_name => 'MBC', :link => 'facebook.com' }]

links.each do |l|
    Link.create!(l)
end