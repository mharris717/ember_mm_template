tap = (obj,f) ->
  f(obj)
  obj

App.DtObj = Em.Object.extend
  dateGetter: ->
    dt = @$datetime
    if dt
      "#{dt.getMonth()+1}/#{dt.getDate()}/#{dt.getFullYear()}"
    else
      ""

  dateSetter: (str) ->
    dt = @$datetime
    if dt
      a = str.split("/")
      if _.filter(a, (c) -> c.length > 0).length == 3
        new_date = new Date(parseInt(a[2]),parseInt(a[0])-1,parseInt(a[1]),dt.getHours(),dt.getMinutes(),dt.getSeconds())
        @set "datetime",new_date


  date: ((key,value) ->
    if arguments.length == 1
      @dateGetter()
    else
      @dateSetter(value)).property("datetime")

  timeGetter: ->
    dt = @$datetime
    if dt
      m = "#{dt.getMinutes()}"
      m = "0#{m}" if m.length == 1
      "#{dt.getHours()}:#{m}"
    else
      ""

  timeSetter: (str) ->
    dt = @$datetime
    if dt
      a = str.split(":")
      if _.filter(a, (c) -> c.length > 0).length == 2
        new_date = new Date(dt.getFullYear(),dt.getMonth(),dt.getDate(),parseInt(a[0]),parseInt(a[1]))
        @set "datetime",new_date



  time: ((key,value) ->
    me = this
    if arguments.length == 1
      @timeGetter()
    else
      @timeSetter(value)).property("datetime")

