
Given /the following workspaces exist/ do |workspaces_table|
  workspaces_table.hashes.each do |workspace|
    Workspace.create workspace
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then /I should see all the workspaces/ do
  # Make sure that all the movies in the app are visible in the table
  Workspace.all.each do |workspace|
    step %{I should see "#{workspace.workspace_name}"}
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
    selected_movie = Movie.find_by(title: movie)
    expect(selected_movie.director).to eq(director)    
end
