var Leap = require('leapjs')

var controller = new Leap.Controller()

var mapPositionData = function(positions){
  var ext = [[-240,240],[120,480],[-80,80]]
  return positions.map(function(p,i){
    var n = (p - ext[i][0])/(ext[i][1] - ext[i][0])
    return n < 0 ? 0 : (n > 1 ? 1 : (i == 2 ? 1 - n : n ))
  })
}

var lastFrameTime = 0
controller.on('frame', function(frame){
  if (Date.now() - lastFrameTime < 250) return
  lastFrameTime = Date.now()
  if (frame.hands.length > 0) {
    var palmPosition = frame.hands[0].stabilizedPalmPosition
    var rgb = mapPositionData(palmPosition).map(function(n){
      return Math.round(n*255)
    })
    console.log(rgb.join(','))
  }
})

controller.connect()