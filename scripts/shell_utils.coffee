# Description:
#   do some system commands to tell the asker about the pi-bot...
#

module.exports = (robot) ->

  robot.hear /Where you at?/i, (res) ->
    @exec = require('child_process').exec

    command = "echo local: `ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1 -d'/'` && echo external: `dig +short myip.opendns.com @resolver1.opendns.com`"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr
    
  robot.hear /update yourself/i, (res) ->
    @exec = require('child_process').exec
    command = "cd /usr/pi-hubot;git pull;sleep 5;sudo reboot"

    res.send command

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

  robot.hear /what can you do pi-hubot?/i, (res) ->
    @exec = require('child_process').exec
    command = "grep robot.hear /usr/pi-hubot/scripts/*"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

  robot.hear /start spring/i, (res) ->
    @exec = require('child_process').exec
    command = "nohup java -jar /home/pi/sbSpeedTest.jar --server.port=8090 &"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

  robot.hear /get download data/i, (res) ->
    @exec = require('child_process').exec
    command = "curl -s 127.0.0.1:8090/doRecord"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr

  robot.hear /speed test/i, (res) ->
    @exec = require('child_process').exec
    command = "curl -s 127.0.0.1:8090/SpeedTest"

    @exec command, (error, stdout, stderr) ->
      res.send error
      res.send stdout
      res.send stderr
