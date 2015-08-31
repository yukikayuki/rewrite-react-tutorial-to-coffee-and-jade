{React, md} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/comment.jade"

class Comment extends React.Component
  render: ->
    rawMarkup = md @props.children.toString(), {sanitize: false}
    template rawMarkup: rawMarkup, author: @props.author

module.exports = Comment
