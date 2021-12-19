Feature: create and organize workspaces

  As a student
  So that I can complete my work in an efficient and effective manner
  I want to manage my links and resources for all aspects of my lifes

Background: workspaces, links, users in database
  Given the following users exist:
  | username |        email         |  first_name  |  last_name  | password  | password_confirmation |
  |  rl2912  | rl2912@columbia.edu  |   Richard    |    Lopez    |  foobar   |        foobar         |
  |  ks3650  | ks3650@columbia.edu  |    Karen     |     Shi     |  foobar   |        foobar         |
  |  nm3076  | nm3076@columbia.edu  |    Naviya    |   Makhija   |  foobar   |        foobar         |  
  |  jp3864  | jp3864@columbia.edu  |   Jessica    |    Peng     |  foobar   |        foobar         |  

  Given the following workspaces exist:
  | workspace_name  | user                | tags      | notes                               |
  | SaaS            | rl2912@columbia.edu | Classes   | Engineering Software as a Service   |
  | MBC             | ks3650@columbia.edu | Classes   | Making, Breaking Codes              |
  | History Lab     | nm3076@columbia.edu | Research  | NLP and Computer Vision             |
  | Intro to Python | jp3864@columbia.edu | TA        | Scheduling and Drive                |
  | Colonial Cities | nm3076@columbia.edu | Classes   | Colonial Cities of the Americas     |

  Given the following links exist:
  | workspace_name   | link                           |
  | SaaS             | 'https://tesla.com/'           |
  | SaaS             | 'https://facebook.com/'        |
  | MBC              | 'https://meta.com/'            |
  | History Lab      | 'https://messenger.com/'       |
  | History Lab      | 'https://gmail.com/'           |
  | Intro to Python  | 'https://calendar.google.com/' |
  | Colonial Cities  | 'https://maps.google.com/'     |
  | Colonial Cities  | 'https://coursera.com/'        |

Scenario: Unsuccessful signin
  Given a user visits the signin page
  When they submit invalid signin information
    Then they should see an error message

Scenario: Successful signin
  Given a user visits the signin page
    And the user has an account
  When the user submits valid signin information
    Then they should see their profile page
    Then they should see a signout link

Scenario: Successful signout
  Given a user visits the signin page
    And the user has an account
  When the user submits valid signin information
    Then they should see their profile page
    Then they should see a signout link 
  When they follow "Log out"
    Then they should be on the signin page

Scenario: Login + add workspace
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Create A New Workspace"
  When I follow "Create A New Workspace"
  Then I should be on the Create New Workspace page
  And I fill in "Name" with "Travel"
  And I press "Add to Workspaces"
  Then I should be on the Dashboard page
  And I should see "Travel"

Scenario: delete specific workspace from database
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Create A New Workspace"
  When I follow "Create A New Workspace"
  Then I should be on the Create New Workspace page
  And I fill in "Name" with "Travel"
  And I press "Add to Workspaces"
  Then I should be on the Dashboard page
  And I should see "Travel"
  When I follow "Travel"
  Then I should be on the workspace page for "Travel"
  When I follow "Delete Workspace"
  Then I should be on the Dashboard page

Scenario: return to dashboard from specific workspace
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Create A New Workspace"
  When I follow "Create A New Workspace"
  Then I should be on the Create New Workspace page
  And I fill in "Name" with "Winter Break"
  And I fill in "Tag" with "Travel"
  And I press "Add to Workspaces"
  Then I should be on the Dashboard page
  And I should see "Travel"
  When I follow "Winter Break"
  Then I should be on the workspace page for "Winter Break"
  When I follow "Back to Dashboard"
  Then I should be on the Dashboard page

Scenario: update specific workspace from database
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Create A New Workspace"
  When I follow "Create A New Workspace"
  Then I should be on the Create New Workspace page
  And I fill in "Name" with "Travel"
  And I press "Add to Workspaces"
  Then I should be on the Dashboard page
  And I should see "Travel"
  When I follow "Travel"
  Then I should be on the workspace page for "Travel"
  When I press "Add Link"
  Then they should see a text area to update the newly created link
  And I press "Save changes"
  Then I should be on the workspace page for "Travel"

Scenario: Login + add workspace
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Create A New Workspace"
  When I follow "Create A New Workspace"
  Then I should be on the Create New Workspace page
  And I fill in "Name" with "Travel"
  And I press "Add to Workspaces"
  Then I should be on the Dashboard page
  When I follow "Profile"
  And I should see "Travel"
  Given a user visits the signup page
  Then I should be on the Dashboard page
  
Scenario: Signup page 
  Given I visit the signup page
  And I fill in "First name" with "richard"
  And I fill in "Last name" with "lopez"
  And I fill in "Email" with "rl3020@columbia.edu"
  And I fill in "Username" with "rl3020"
  And I fill in "Password" with "foobar"
  And I fill in "Confirmation" with "foobar"
  And I press "Create Account"
  Then I should be on the Dashboard page
  And I should see "Create A New Workspace"

Scenario: Deleting links from workspace
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Genes"
  When I follow "Genes"
  Then I should be on the workspace page for "Genes"
  And I should see "Delete Link"
  When I follow "Delete Link"
  Then I should be on the workspace page for "Genes"
  
  
Scenario: update links from workspace
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Genes"
  When I follow "Genes"
  Then I should be on the workspace page for "Genes"
  Then they should see a text area to update the newly created link
  When I add details for the links to update
  And I press "Save changes"
  Then I should be on the workspace page for "Genes"

Scenario: open all links from workspace
  Given a valid user
  When I go to the login page
  And I fill in "Email" with "test@columbia.edu"
  And I fill in "Password" with "hello"
  And I press "Log in"
  Then I should be on the Dashboard page
  And I should see "Genes"
  When I follow "Genes"
  Then I should be on the workspace page for "Genes"
  And I press "Open All"
  Then I should be on the workspace page for "Genes"
