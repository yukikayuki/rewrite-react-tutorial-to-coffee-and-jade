{React, $} = require 'vendor'

CommentBox = require './content_box/index.coffee'

React.render(
  $(CommentBox, {url: "comments.json", pollInterval: 2000})
  document.getElementById('app')
)
