# README

## Overview of tab 
**tab** is a workspace, flow tracking and optimization application. **tab** allows users to create and manage workspaces, automate setting up a working environment, take notes and collaborate on workspaces with others.<br />

**tab** provides:
- Unlimited workspace storage and optimization
- Fast workspace initialization, modification and deletion
- Workspace collaboration with others
- Seamless organization to filter workspaces by tags
- Simple and intuititve user interface
- One click automation to open links in a workspace

### Summary of Iteration 1 features
- Dashboard to view all existing workspaces
- Add new workspace
- Delete existing workspace
- Add link(s) to existing workspace
- Delete link(s) from existing workspace
- Open all links in existing workspace

### Summary of Iteration 2 features (and extensions)
- User Registration and profile creation
- User Log In/Log Out functionality
    - Created sessions to keep track of user logs
- Password encryption and user authorization/authentication
    - Users are only able to access their own workspaces and links
    - Users are limited to their profile page
    - Error checking for creating a new account and logging in: email format, unique accounts, password confirmation, etc.
- User-specific workspaces and links
- Editing and updating workspaces and content
- Database Expansion: user table, more features for workspaces and links
- Expansion of user-friendliness: improvement to front-end UI/UX

### Summary of Project Launch features (and extensions)
- Individual user profiles: profile card, list of existing workspaces
- Tags
    - Users can create tags for their workspaces
    - Users can filter by tag to better organize their workspaces
- Collaboration
    - Users can share their workspaces with other users
    - Users select a role for other users when creating a collaboration: "Project Owner" or "Update and View"
        - Users with "Project Owner" access can edit the workspace and share the workspace with other users
        - Users with "Update and View" access can only edit the workspace
    - Updated dashboard for "Workspaces Shared With Me" to include workspaces that have been shared with the user via "Update and View" access
- Database expansion: collaboration table
- Expansion of user-friendliness: improvement to front-end UI/UX

<br />
**Link to Github repo**: https://github.com/nm3076/saas-tab.git <br />
**The Relevant Branch is**: proj-launch <br />
**Heroku link**: https://secure-mesa-61460.herokuapp.com/ <br />
**Link to Project Demo video**: https://www.youtube.com/watch?v=J23djb0s-j4 
<br />

### Notes (updated as of Project Launch)
#### On running the program
- Please disable any ad blockers on your web browser/alternatively whitelist the root host before clicking on `Open All` in the specific workspace to open all associated links
- Please enter valid links that start with `https://www.`, `http://www.`, `http://`, or `https://` when adding new links (`Open All` only opens valid links to the browser)
#### On testing the program
- The RSpec and Cucumber tests cover all models, views, and controllers
- Our joint results currently yield [XX.XX%] coverage.
#### On test results
- Joint RSpec and Cucumber coverage locally yields [XX.XX%]. However, when deploying to heroku, there was an error to "define constant ApplicationCable::Connection, but didnt". In order to fix this, we uncommented the code in the `app/channels/application_cable/*` files. These two classes under this module `application_cable` are unused, but were left in for heroku deployment purposes.

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
