Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and search on director information in movies I enter

Background: workspaces in database

  Given the following workspaces exist:
  | workspace_name  |
  | SaaS            |
  | MBC             |
  | Research        |
  | TA              |

Scenario: see all workspaces on home page
  Given I am on the home page
  Then I should see all the workspaces