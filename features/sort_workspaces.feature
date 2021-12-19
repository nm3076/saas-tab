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


