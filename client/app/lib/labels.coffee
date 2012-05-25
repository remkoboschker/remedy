Spine = require('spine')
labelsData = require('lib/labelsData')

class Labels extends Spine.Module
  
  constructor: (context) ->
    super
    @labelsData = labelsData[context]
    @lang = 'nl'

  get: (attr) ->
    @labelsData[attr][@lang]
    
module.exports = Labels