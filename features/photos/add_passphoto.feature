Feature: Add passphoto
    In order to identify customers
    as an assistent
    I want to add a passphoto the a clients record
    
    Background: there is a queue of photos that need to be taken at remedy.informatietuin.nl/photos/queue
    
    Scenario: a new client is ready for his pass photo to be taken
        Given I select the client from the queue
        When I take the photo
        Then the photo is presented on the screen
        When I click on 'ok'
        Then the photo is added to the clients record

  

