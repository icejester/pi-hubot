# Description:
#   light up and read som pins
#

module.exports = (robot) ->

  Gpio = require('onoff').Gpio
  led = new Gpio(21, 'out')
  button = new Gpio(18, 'in', 'both')

  robot.hear /led on/i, (res) ->
    res.send "PIN 21 now lit up!"
    led.writeSync(1)
    if robot.auth.hasRole(res.envelope.user, 'gpio')
      res.send "PIN 21 now lit up!"
      led.writeSync(1)
    else
      res.send "Oh HELL no. I'm not sending 5 volts through someone with their fingers on the wires..."
      res.send res.envelope.user

  robot.hear /led off/i, (res) ->
    res.send "PIN 21 now off."
    led.writeSync(0)

  button.watch(err, value) ->
    console.log(err)
    msg = if value then "Detected physical button press." else "Button released"
    robot.send({room: 'pi-integration'},msg)

  exit = () ->
    led.unexport()
    process.exit()

  process.on('SIGINT', exit)
