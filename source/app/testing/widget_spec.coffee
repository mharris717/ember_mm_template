mocha.setup('bdd')

window.onload = ->
  runner = mocha.run()

assert = chai.assert

describe 'all', ->
  t = setupTesting()

  describe "Widget", ->
    describe "Widget List", ->
      it 'smoke', ->
        assert.equal 4,2+2

  describe "LifeEvent", ->
    describe "Event List", ->
      t.startAtRoute "life_events.index"

      it 'smoke', ->
        assert.equal App.LifeEvent.find().get('length'),3

      it 'rows', ->
        assert.equal t.$("table.events .event").length,2

      it 'first row', ->
        assert.equal t.$("table.events .event:eq(0) td:eq(0)").text(),"Ran 3 Miles"
        assert.equal t.$("table.events .event:eq(1) td:eq(0)").text(),"Ran 2 Miles"

    describe "New Event", ->
      t.startAtRoute "life_events.index"

      it 'event date', ->
        fs = t.$("#new-event .date-field")
        assert.equal fs.length,1
        act = fs.val()
        d = new Date
        exp = "#{d.getMonth()+1}/#{d.getDate()}/#{d.getFullYear()}"
        assert.equal act,exp

      it 'appears in list', ->
        f = t.$("#new-event input:eq(0)")
        f.val "Ate 1 Egg"
        f.change()
        assert.equal t.$("table.events .event").length,3

      it 'saves', ->
        f = t.$("#new-event input:eq(0)")
        f.val "Ate 1 Egg"
        f.change()

        ft = t.$("#new-event .time-field")
        ft.val "3:20"
        ft.change()

        t.$('#new-event button').click()
        assert.equal f.val(),""
        assert.equal ft.val(),"3:20"

        d = new Date
        exp = "#{d.getMonth()+1}/#{d.getDate()}/#{d.getFullYear()}"
        assert.equal t.$("#new-event .date-field").val(),exp

    describe "Existing Event", ->
      t.startAtRoute "life_events.index"

      it 'click to edit', ->
        row = t.$("table.events tr:eq(1)")

        raw_cell = -> row.find("td.raw-text")
        edit_cell = -> row.find("td.edit")

        assert.equal raw_cell().text(), "Ran 3 Miles"
        assert.equal raw_cell().find("input").length,0
        assert.equal edit_cell().find("a").length,1

        edit_cell().find("a").click()

        assert.equal raw_cell().find("input").length,1
        assert.equal raw_cell().find("input").val(),"Ran 3 Miles"

        

