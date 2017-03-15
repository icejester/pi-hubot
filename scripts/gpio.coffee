# Description:
#   light up and read som pins
#

module.exports = (robot) ->

  Gpio = require('onoff').Gpio
  led = new Gpio(21, 'out')

  robot.hear /led on/i, (res) ->
    res.send "PIN 21 now lit up!"
    led.writeSync(1)

  robot.hear /led off/i, (res) ->
    res.send "PIN 21 now off."
    led.writeSync(0)

  exit = () ->
    led.unexport()
    process.exit()

  process.on('SIGINT', exit)
