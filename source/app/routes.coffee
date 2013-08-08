App.Router.map ->
  @resource "widgets", ->
    @resource "widget", {path: "/:widget_id"}

  @resource 'life_events', ->
    #@resource 'life_event', {path: '/:life_event_id'}
    @resource "new_life_event"
    @route "speak", {path: '/speak'}

  @route "sign_in", {path: '/sign_in/:auth_token'}

  @resource "users", ->
    @resource "fun"