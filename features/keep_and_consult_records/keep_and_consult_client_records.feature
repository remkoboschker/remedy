Feature: Keep and consult client records
  In order to comply with medical guidelines
  In order to be aware of a clients history
  In order to be alerted to sensitivities, intoxications and pregnancy
  In order to comply with bookkeeping guidelines
  In order to personalise visits
  In order to market and sell
  As a physician, manager, assistent
  I want to view, create and update client records
  
  The client record contains:
  | group              | name              | type | default | possible values |
  | personal           | initials          |      |         |                 |
  |                    | givenName         |      |         |                 |
  |                    | familyName        |      |         |                 |
  |                    | dateOfBirth       |      |         |                 |
  |                    | sex               |      |         |                 |
  |                    | idNumber          |      |         |                 |
  |                    | idDocument        |      |         |                 |
  |                    | passphoto         |      |         |                 |
  | tel                | work              |      |         |                 |
  |                    | private           |      |         |                 |
  | mail               | work              |      |         |                 |
  |                    | private           |      |         |                 |
  | ice                | tel               |      |         |                 |
  |                    | name              |      |         |                 |
  |                    | relation          |      |         |                 |
  | address            | street            |      |         |                 |
  |                    | number            |      |         |                 |
  |                    | extension         |      |         |                 |
  |                    | postalcode        |      |         |                 |
  |                    | city              |      |         |                 |
  |                    | country           |      |         |                 |
  | alerts             | antibiotics       |      |         |                 |
  |                    | lidocaine         |      |         |                 |
  |                    | xylocain          |      |         |                 |
  |                    | pregnant          |      |         |                 |
  |                    | bruising          |      |         |                 |
  | intoxications      | smoking           |      |         |                 |
  |                    | alcohol           |      |         |                 |
  |                    | drugs             |      |         |                 |
  | insurance          | insurance company |      |         |                 |
  |                    | insurance number  |      |         |                 |
  | consent            | botox             |      |         |                 |
  |                    | carboxy           |      |         |                 |
  |                    | hyaluron          |      |         |                 |
  | history            | internal medicin  |      |         |                 |
  |                    | cardiology        |      |         |                 |
  |                    | injectibles       |      |         |                 |
  |                    | facial surgery    |      |         |                 |
  |                    | lungs             |      |         |                 |
  |                    | neurology         |      |         |                 |
  | paymentdetails     | bankaccountnumber |      |         |                 |
  |                    | creditcardnumber  |      |         |                 |
  | invoices           |                   |      |         |                 |
  | offers             |                   |      |         |                 |
  | payments           |                   |      |         |                 |
  | appointments       |                   |      |         |                 |
  | no-shows           |                   |      |         |                 |
  | appointments moved |                   |      |         |                 |
  | observations       |                   |      |         |                 |
  | notes              |                   |      |         |                 |
  | social media       | twitter           |      |         |                 |
  |                    | facebook          |      |         |                 |
  
    Scenario: title
        Given context
        When event
        Then outcome
    
    Scenario: title
        Given context
        When event
        Then outcome
