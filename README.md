# README

## Overview of tab 
**tab** is a workspace, research, flow tracking and optimization application. **tab** allows users to create workspaces, which are a series of links that are tracked during a session and put into the database so that the application will start up all relevant tabs and applications needed for a workspace which can be for a specific class, work, research, essay, among other use cases. <br /> <br />

### Summary of Iteration 1 features
- Dashboard to view all existing workspaces
- Add new workspace
- Delete existing workspace
- Add link(s) to existing workspace
- Delete link(s) from existing workspace
- Open all links in existing workspace

### Summary of Iteration 2 features (and extensions)
- User Registration and profile creation
- User Login
- Password encryption and user authorization/authentication
- Individual user profiles
- User-specific workspaces and links
- Editing and updating workspaces and content
- Database Expansion: user table, collaborators table, more features for workspaces and links

**Link to Github repo**: https://github.com/nm3076/saas-tab.git <br />
**The Relevant Branch is**: iter-2 <br />
**Heroku link**: https://secure-mesa-61460.herokuapp.com/


### Notes (updated as of Iteration 2)
#### On running the program
- Please disable any ad blockers on your web browser/alternatively whitelist the root host before clicking on `Open All` in the specific workspace to open all associated links
- Please enter valid links that start with `https://www.`, `http://www.`, `http://`, or `https://` when adding new links (`Open All` only opens valid links to the browser)
#### On testing the program
- The RSpec and Cucumber tests cover all models, views, and controllers - any % that may not be covered falls under JS (for adding, deleting, and opening all links functionalities)
- After discussing with the TAs (George, Chengrui, Mohar), we have not included unit-tests or testing for our JS functions (specifically: add_link_to_workspace, delete_link_from_workspace, open_links, update). According to Professor Yang's response to Piazza post @444, testing is not required for apps that use Rails and simple JS to improve UI (as we have). According to George, we do not need cucumber tests for the controller functions for this iteration (1 & 2), and do not need unit tests for these JS functions at all! However, our cucumber score is a little lower than expected due to this, but Chengrui indiciated that this was acceptable as of 11/17/2021.
- Our joint results currently yield: [ _____ ]
#### On test results
- Joint RSpec and Cucumber coverage locally yields [ _____ ]. However, when deploying to heroku, there was an error to "define constant ApplicationCable::Connection, but didnt". In order to fix this, we uncommented the code in the `app/channels/application_cable/*` files. These two classes under this module `application_cable` are unused, but were left in for heroku deployment purposes.

## Running the program locally
0.  `bundle install` (installs necesarry gems, etc.)
1.  `rails webpacker:install` (not currently included in gemfile due to environment discrepancies - will be rectified) 
2.  `rails db:drop` (optional, only if needed to destroy database first)
3.  `rails db:create db:migrate db:seed` (create, migrate, and seed the database)
4.  `rails server` (launch web server locally)
5.  open `http://127.0.0.1:3000` or `http://[::1]:3000` on a web browser

## Running the test suite
#### Testing with RSpec
Run `bundle exec rspec`
#### Testing with Cucumber
Run `rake cucumber`
#### View complete coverage report
Run `open coverage/index.html` 

## Group members
* Richard Lopez - rl3020
* Naviya Makhija - nm3076
* Jessica Peng - jp3864
* Karen Shi - ks3650
