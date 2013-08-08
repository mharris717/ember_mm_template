App.ApplicationController = Ember.Controller.extend()

App.IndexRoute = Ember.Route.extend
  redirect: ->
    @transitionTo 'life_events {{REPLACE}}'
