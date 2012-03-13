Spine = require('spine')

class Employment extends Spine.Model
  @configure 'Employment', 'rol', 'bankAccNmbr', 'contract', 'cv', 'inService', 'outService'
  
module.exports = Employment