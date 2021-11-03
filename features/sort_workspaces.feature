Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: workspaces, links in database

  Given the following workspaces exist:
  | workspace_name  |
  | SaaS            |
  | MBC             |
  | Research        |
  | TA              |

  Given the following links exist:
  | workspace_name  |             link                      |
  | SaaS            |    'https://tesla.com/'               |
  | MBC             |    'https://facebook.com/'            |
  | MBC             |    'https://meta.com/'                |
  | Research        |    'https://messenger.com/'           |
  | Research        |    'https://gmail.com/'               |
  | TA              |    'https://calendar.google.com/'     |
  | TA              |     'https://tesla.com/'              |

Scenario: see all workspaces on home page
  Given I am on the home page
  Then I should see all the workspaces

Scenario: add workspace to database
  Given I am on the home page
  When I follow "Add new workspace"
  Then I should be on the Create New Workspace page
  And I fill in "Name" with "Travel"
  And I press "Add to Workspaces"
  Then I should be on the home page
  And I should see "Travel"

Scenario: go to specific workspace and see all associated links
  Given I am on the home page
  And I go to the workspace page for "MBC"
  Then I should see the "https://facebook.com/" link
  And I should see the "https://meta.com/" link
  And I should not see the "https://messenger.com/" link
  And I should not see the "https://calendar.google.com/" link