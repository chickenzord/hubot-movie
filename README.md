# hubot-movie

A hubot script that search movie info from IMDB via OMDB

See [`scripts/movie.coffee`](scripts/movie.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-movie --save`

Then add **hubot-movie** to your `external-scripts.json`:

```json
[
  "hubot-movie"
]
```

## Sample Interaction

```
user1>> hubot movie search ant-man
hubot>> http://www.imdb.com/title/tt0478970/
user1>> hubot movie poster ant-man
hubot>> http://ia.media-imdb.com/images/M/MV5BMjM2NTQ5Mzc2M15BMl5BanBnXkFtZTgwNTcxMDI2NTE@._V1_SX300.jpg
```
