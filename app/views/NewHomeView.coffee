RootView = require 'views/core/RootView'
template = require 'templates/new-home-view'
CocoCollection = require 'collections/CocoCollection'
Course = require 'models/Course'

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

  events:
    'change #school-level-dropdown': 'onChangeSchoolLevelDropdown'

  constructor: (options) ->
    super(options)
    @courses = new CocoCollection [], {url: "/db/course", model: Course}
    @supermodel.loadCollection(@courses, 'courses')

  afterRender: ->
    @onChangeSchoolLevelDropdown()
    super()

  onChangeSchoolLevelDropdown: (e) ->
    levels =
      elementary: {'introduction-to-computer-science': '2-4', 'computer-science-5': '15-20', default: '10-15', total: '50-70 hours (about one year)'}
      middle: {'introduction-to-computer-science': '1-3', 'computer-science-5': '7-10', default: '5-8', total: '25-35 hours (about one semester)'}
      high: {'introduction-to-computer-science': '1', 'computer-science-5': '6-9', default: '5-6', total: '22-28 hours (about one semester)'}
    level = if e then $(e.target).val() else 'middle'
    @$el.find('#courses-container .course-details').each ->
      slug = $(@).data('course-slug')
      duration = levels[level][slug] or levels[level].default
      $(@).find('.course-duration .course-hours').text duration
    @$el.find('#semester-duration').text levels[level].total
