setupTestingSpecific = ->
  abc = 42

window.setupTesting = ->
  res = setupTestingGeneric()
  setupTestingSpecific()
  res
