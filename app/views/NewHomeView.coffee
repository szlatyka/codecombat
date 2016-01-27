RootView = require 'views/core/RootView'
template = require 'templates/new-home-view'

###
  Notes:
  * Can't center align navbar links easily
  
  Todos:
  * Hook up login and create account buttons
  * Set up navbar to collapse
  * Get rid of modal wrapper shadow at top of page
  
###

module.exports = class NewHomeView extends RootView
  id: 'new-home-view'
  className: 'style-flat'
  template: template
