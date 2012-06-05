Feature: Keep client records
    In order to comply with medical guidelines   
    In order to be aware of a clients history   
    In order to be alerted to sensitivities, intoxications and pregnancy  
    In order to comply with bookkeeping guidelines  
    In order to personalise visits  
    In order to market and sell  
    As a physician  
    As a manager  
    As an assistent  
    I want to create client records  
    I want to view read records  
    I want to update client records  
    I want to delete client records  
  
    Background:
        Given this client record:
        
        
        | group              | name              | examples | 
        | personal           | initials          |           |
        |                    | givenName         |           |
        |                    | familyName        |           |
        |                    | dateOfBirth       |           |
        |                    | sex               |           |
        |                    | idNumber          |           |
        |                    | idDocument        |           |
        |                    | passphoto         |           |
        | tel                | work              |           |
        |                    | private           |           |
        | mail               | work              |           |
        |                    | private           |           |
        | ice                | tel               |           |
        |                    | name              |           |
        |                    | relation          |           |
        | address            | street            |           |
        |                    | number            |           |
        |                    | extension         |           |
        |                    | postalcode        |           |
        |                    | city              |           |
        |                    | country           |           |
        | alerts             | antibiotics       |           |
        |                    | lidocaine         |           |
        |                    | xylocain          |           |
        |                    | pregnant          |           |
        |                    | bruising          |           |
        | intoxications      | smoking           |           |
        |                    | alcohol           |           |
        |                    | drugs             |           |
        | insurance          | insurance company |           |
        |                    | insurance number  |           |
        | consent            | botox             |           |
        |                    | carboxy           |           |
        |                    | hyaluron acid     |           |
        | history            | internal medicin  |           |
        |                    | cardiology        |           |
        |                    | injectibles       |           |
        |                    | facial surgery    |           |
        |                    | lungs             |           |
        |                    | neurology         |           |
        | payment details    | bankaccountnumber |           |
        |                    | creditcardnumber  |           |
        | invoices           |                   |           |
        | offers             |                   |           |
        | payments           |                   |           |
        | appointments       |                   |           |
        | no-shows           |                   |           |
        | appointments moved |                   |           |
        | observations       |                   |           |

        | social media       | twitter           |           |
        |                    | facebook          |           |
