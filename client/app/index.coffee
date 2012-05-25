require('lib/setup')

Spine     = require('spine')
Navbar    = require('controllers/navbar')
Container = require('controllers/container')


class App extends Spine.Controller
  constructor: ->
    super

    @navbar    = new Navbar
    @container = new Container
    
    @append @navbar, @container

    Spine.Route.setup()

module.exports = App
    