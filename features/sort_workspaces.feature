Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following workspaces exist:
  | workspace_name        
  | SaaS                  
  | MBC                   
  | When Harry Met Sally    
  | The Help                
  | Chocolat                
  | Amelie                  
  | 2001: A Space Odyssey   
  | The Incredibles         
  | Raiders of the Lost Ark 
  | Chicken Run             

  And  I am on the RottenPotatoes home page
  Then 10 seed movies should exist

Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  When I check the following ratings: PG, R
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G, PG-13
  # enter step to "submit" the search form on the homepage
  And I press "Refresh"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see "The Incredibles"
  And I should see "Raiders of the Lost Ark"
  And I should see "The Terminator"
  And I should see "When Harry Met Sally"
  And I should see "Amelie"
  # enter step(s) to ensure that other movies are not visible
  And I should not see "Aladdin"
  And I should not see "The Help"
  And I should not see "Chocolat"
  And I should not see "2001: A Space Odyssey"
  And I should not see "Chicken Run"

Scenario: all ratings selected
  # see assignment
  When I check the following ratings: PG, G, R, PG-13
  Then I should see all of the movies
