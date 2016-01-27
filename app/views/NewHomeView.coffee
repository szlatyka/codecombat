RootView = require 'views/core/RootView'
template = require 'templates/new-home-view'

###
  Notes:
  * Can't center align navbar links easily
  
  TODO:
  * Hook up login and create account buttons
  * Set up navbar to collapse
  * Get rid of modal wrapper shadow at top of page
  * auto margin feature paragraphs
  * Reorder testimonial columns in xs width
  
###

module.exports = class NewHomeView extends RootView
  id: 'new-home-view'
  className: 'style-flat'
  template: template
