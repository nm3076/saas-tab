
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
