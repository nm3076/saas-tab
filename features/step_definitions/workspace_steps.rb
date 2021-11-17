Given /^a valid user$/ do
  @user = User.create!({
             :username => "karen",
             :email => "test@columbia.edu",
             :password => "hello"
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit login
  fill_in "Email", :with => "test@columbia.edu"
  fill_in "Password", :with => "hello"
  click_button "Log in"
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

Given /the following workspaces exist/ do |workspaces_table|
  workspaces_table.hashes.each do |workspace|
    Workspace.create workspace
  end
end

Given /the following links exist/ do |links_table|
  links_table.hashes.each do |link|
    Link.create link
  end
end

Then /I should see all the workspaces/ do
  # Make sure that all the movies in the app are visible in the table
  Workspace.all.each do |workspace|
    step %{I should see "#{workspace.workspace_name}"}
  end
end

Then /I should see the "(.*)" link/ do |l|
  # Make sure that you see the relevant links for a workspace
  expect(page.body) =~ l
end

Then /I should not see the "(.*)" link/ do |l|
  # Make sure that you see the relevant links for a workspace
  !expect(page.body) =~ l
end
