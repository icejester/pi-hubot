# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.hear /jrmallas/i, (res) ->
    res.send "Praise be his name."

  robot.hear /jfmallas/i (res) ->
    res.send "He is the kind of guy who would only use me to stream movies..."
