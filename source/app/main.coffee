window.App = Ember.Application.create()

  

App.Store = DS.Store.extend
  revision: 11
  adapter: 'DS.RESTAdapter'

DS.RESTAdapter.reopen
  url: ezqServerUrl()
  buildURL: (record, suffix) ->
    record = "ember_user" if record == 'user'
    s = @._super(record, suffix)
    s + ".json"
  
DS.RESTAdapter.registerTransform 'hash',
  serialize: (value) -> value
  deserialize: (value) -> value

