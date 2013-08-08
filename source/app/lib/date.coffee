Ember.Handlebars.registerBoundHelper 'prettyDate', (dt,options) ->
  res = ""
  if dt
    m = "#{dt.getMinutes()}"
    m = "0#{m}" if m.length == 1
    y = "#{dt.getFullYear()}"[2..3]
    res = "#{dt.getMonth()+1}/#{dt.getDate()}/#{y} #{dt.getHours()}:#{m}"
  new Handlebars.SafeString(res)

App.DateField = Em.TextField.extend
  classNames: ["date-field"]
  didInsertElement: ->
    @.$().datepicker().on 'changeDate', =>
      @.$().trigger('change')

App.DateAndTimeField = Em.View.extend
  tagName: "span"
  templateName: "date/date_and_time_field"
  dtObj: (-> 
    App.DtObj.create(datetimeBinding: "parent.datetime", parent: this)).property("datetimeBinding")

  dateBinding: "dtObj.date"
  timeBinding: "dtObj.time"

App.TimeField = Em.TextField.extend
  classNames: ['time-field']