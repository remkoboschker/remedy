Spine = require('spine')

class FieldNames extends Spine.Model
  @configure 'FieldNames', 'language', 'model', 'attribute', 'label'
  
module.exports = FieldNames