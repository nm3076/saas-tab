# README

### Tab 
**tab** is a workspace, research, flow tracking and optimization application. **tab** allows users to create workspaces, which are a series of links that are tracked during a session and put into the database so that the application will start up all relevant tabs and applications needed for a workspace which can be for a specific class, work, research, essay, among other use cases.

## Summary of app's iteration 1 features
- Dashboard to view all existing workspaces
- Add new workspace
- Delete existing workspace
- Add link(s) to existing workspace
- Delete link(s) from existing workspace
- Open all links in existing workspace

### Notes
## On running the program
- Please disable any ad blockers on your web browser before clicking on "Open All" in the specific workspace to open all associated links
- Please enter valid links that start with 'https://www.', 'http://www.', 'http://', or 'https://' when adding new links
## On testing the program
- The RSpec and Cucumber tests cover all models, views, and controllers - any % that may not be covered falls under JS (for adding, deleting, and opening all links functionalities)

### Link to Github repo
https://github.com/nm3076/saas-tab.git

### Heroku App
To access our application:
https://secure-mesa-61460.herokuapp.com/

### Running the program locally
1.  `rails db:drop` (optional, only if needed to destroy db first)
2.  `rails db:create db:migrate db:seed` (create, migrate, and seed the database)
3.  `rails server` (launch web server locally)
4.  open "http://127.0.0.1:3000" or "http://[::1]:3000" on a web browser

### Running the Test Suite
## Testing with RSpec
To test with rspec run: `bundle exec rspec`
## Testing with Cucumber
To test with cucumber run: `rake cucumber`

To see a complete coverage report, run: `open coverage/index.html` 

### Group Members
* Richard Lopez - rl3020
* Naviya Makhija - nm3076
* Jessica Peng - jp3864
* Karen Shi - ks3650
