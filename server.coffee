express            = require 'express'
request            = require 'request'
processor          = require './lib/processor'
https              = require 'https'
url_module         = require 'url'
_                  = require 'underscore'

app = express()

app.get '/doc', ( req1, res1 ) ->
  reply = (data) ->
    switch format
      when 'json'
        res1.writeHead 200, 'Content-Type': 'application/json'
        res1.end JSON.stringify data
      when 'html'
        if data.result?
          res1.writeHead 200, 'Content-Type': 'text/html'
          res1.end (render_html data.result), 'utf8'
        else
          res1.writeHead 500, 'Content-Type': 'text/html'
          res1.end data.error

  id = req1.query.id
  unless id?
    reply error: 'Required parameter "id" not present'
    return

  format = req1.query.format or 'json'
  url = "https://docs.google.com/feeds/download/documents/export/Export?id=#{id}&exportFormat=html"

  # second request
  opts = url_module.parse url
  opts.method = 'GET'
  req2 = https.request opts, (res2) -> 
    switch res2.statusCode
      when 404
        reply error: 'Cannot find Google Doc with ID = ' + id
      when 302, 303
        reply error: 'Unauthorized. Please set sharing to "Public" or "Anyone with link can View"'
      when 200
        res2.setEncoding 'utf8'
        chunks = []
        res2.on 'data', (chunk) -> chunks.push chunk
        res2.on 'end', ->
          processor chunks.join(''), (e, data) ->
            if e?
              reply error: e.toString()
            else
              reply result: data
      else
        reply error: 'HTTP Status ' + res2.statusCode

  req2.on 'error', (e) -> reply error: e.toString()
  
  req2.end()

render_html = ( data ) ->
  data2 = _.clone data
  data2.styles = '(RENDERED BELOW AS HTML)'
  data2.body = '(RENDERED BELOW AS HTML)'
  """<!doctype html>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <title type="text/css">#{data.title}</title>
      <style>#{data.styles}</style>
    </head>
    <body>
      <pre>#{JSON.stringify(data2, null, 2)}</pre>
      <img src="#{data.image}"/>
      <hr/>
      #{data.body}
    </body>
  </html>
  """

PORT = process.env.PORT or 9007

app.listen PORT, (e) ->
  if e? then throw e
  console.log "app listening on port " + PORT