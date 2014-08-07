var Leap = require('leapjs')

var controller = new Leap.Controller()

var lastFrameTime = 0
controller.on('frame', function(frame){
  if (Date.now() - lastFrameTime < 1000) return
  lastFrameTime = Date.now()
  var hands = frame.hands.map(function(hand){
    delete(hand.frame)
    return hand
  })
  console.log(frame.hands)
})

controller.connect()