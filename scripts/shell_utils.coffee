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
