var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var employeeSchema = new Schema({
    personal: {
        initials: {type: String, default: 'initialen'},
        givenName: {type: String, default: 'voornaam'},
        familyName: {type: String, default: 'achternaam'},
        dateOfBirth: {type: String, default: 'geboortedatum'},
        sex: {type: String, default: 'geslacht'},
        idNumber: {type: String, default: 'bsn'},
        idDocument: {type: String, default: 'legitimatie'}
    },
    photo: {
        type: String, default: 'profielfoto'},  
    tel: {   
        work: {type: String, default: 'tel_werk'},
        private: {type: String, default: 'tel_prive'}
    },
    mail: {
        work: {type: String, default: 'mail_werk'},
        private: {type: String, default: 'mail_prive'}
    },
    ice: {
        tel: {type: String, default: 'ice_tel'},
        name: {type: String, default: 'ice_naam'},
        relation: {type: String, default: 'ice_relatie'}
    },
    address: {
        street: {type: String, default: 'straat'},
        number: {type: String, default: 'huisnummer'},
        extension: {type: String, default: 'huisnummer_toevoeging'},
        postalcode: {type: String, default: 'postcode'},
        city: {type: String, default: 'woonplaats'},
        country: {type: String, default: 'land'}
    },
    employed: {
        role: {type: String, default: 'rol'},
        bankAccountNumber: {type: String, default: 'bankrekening'},
        inService: {type: String, default: 'in_dienst'},
        outService: {type: String, default: 'uit_dienst'},
        cv: {type: String, default: 'cv'},
        contract: {type: String, default: 'contract'}
    }   
});

employeeSchema.methods.toSpine = function () {
  var obj = this.toObject();
  obj.id = obj._id;
  delete obj._id;
  return obj;
}

mongoose.connect('mongodb://localhost/remedyDB');
mongoose.model('Employee', employeeSchema);
mongoose.disconnect();

module.exports = mongoose.model('Employee');
