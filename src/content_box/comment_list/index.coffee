{React, $} = require 'vendor'
jade = require 'react-jade'

Comment = require './comment.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) ->
      $ Comment, {author: comment.author}, comment.text

    template commentNodes: commentNodes

module.exports = CommentList
