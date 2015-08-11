# Description:
#   Allows Hubot to search movie info using OMDB API
#   (Open Movie Database - http://omdbapi.org)
#
# Commands:
#   hubot movie search <title> - search movie info from IMDB
#   hubot movie poster <title> - search movie poster from IMDB
#
# Author:
#   Akhyar Amarullah <akhyrul@gmail.com>

module.exports = (robot) ->

  show_error = (bot) ->
    bot.send "Error searching movie"

  robot.respond  /movie search (.+)/i, (bot) ->
    title = encodeURIComponent bot.match[1]
    params = { 'r': 'json', 't': title }
    robot.http("http://www.omdbapi.com/?r=json&t=#{title}")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          show_error bot
          return

        try
          movie = JSON.parse body
          id = movie['imdbID']
          bot.send "http://www.imdb.com/title/#{id}/"
        catch error
          bot.send "Error parsing response"

  robot.respond  /movie poster (.+)/i, (bot) ->
    title = encodeURIComponent bot.match[1]
    params = { 'r': 'json', 't': title }
    robot.http("http://www.omdbapi.com/?r=json&t=#{title}")
      .header('Accept', 'application/json')
      .get() (err, res, body) ->
        if err
          show_error bot
          return

        try
          movie = JSON.parse body
          bot.send movie['Poster']
        catch error
          bot.send "Error parsing response"
