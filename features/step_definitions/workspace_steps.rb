Given /^a user visits the signin page$/ do
  visit root_path
end

When /^they submit invalid signin information$/ do
  click_button "Log in"
end

Then /^they should see an error message$/ do
  page.should have_selector ".alert", text: "Invalid email/password combination"
end

Given /^the user has an account$/ do
  @user = User.create(username: "Karen", email: "test@columbia.edu",
                      password: "hello", password_confirmation: "hello")
end

When /^the user submits valid signin information$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Log in"
  visit workspaces_path
end

Then /^they should see their profile page$/ do
  page.should have_selector('h4', text: @user.first_name)
end

Then /^they should see a signout link$/ do
  page.should have_link('Log out', href: logout_path)
end

Then /^they should be on the signin page$/ do
  visit root_path
  page.should have_link('Log in', href: login_path)
end

Given /^a valid user$/ do
  @user = User.create!({
             :username => "karen",
             :email => "test@columbia.edu",
             :password => "hello"
           })
end

Given /^I am logged in as a user$/ do
  @current_user = User.create!({
    :username => "karen",
    :email => "test@columbia.edu",
    :password => "hello"
  })
  login_as(@current_user, :scope => :user)
end

Given /^I log out$/ do
  logout
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
