Spine = require('spine')

class Employee extends Spine.Model
  
  @configure 'Employee'

 # @hasOne 'ice', 'models/ice'

module.exports = Employee