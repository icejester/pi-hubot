# Description:
#   do some system commands to tell the asker about the pi-bot...
#

module.exports = (robot) ->

  robot.hear /Where you at?/i, (res) ->
    @exec = require('child_process').exec
    command = "ifconfig"

    res.send "This bot currently reports ifconfig as follows:"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

  robot.hear /update yourself/i, (res) ->
    @exec = require('child_process').exec
    command = "cd /usr/pi-hubot;git pull"

    res.send command

##     @exec command, (error, stdout, stderr) ->
##       res.send error
##       res.send stdout
##       res.send stderr

##     command = "git pull"

    res.send command

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

    command = "sudo reboot"

    res.send "Rebooting..."

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

  robot.hear /go to bed pi-hubot/i, (res) ->
    @exec = require('child_process').exec
    command = "sudo shutdown"

    res.send "Good night kids!"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

