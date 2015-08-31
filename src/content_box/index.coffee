{React, $, jq} = require 'vendor'
jade = require 'react-jade'

CommentList = require './comment_list/index.coffee'
CommentForm = require './comment_form/index.coffee'

template = jade.compileFile "#{__dirname}/template.jade"

class ContentBox extends React.Component
  constructor: ->
    @state =
      data: []

  fetchComments: ->
    jq.ajax
      url: @props.url
      dataTYpe: 'json'
      cache: false

    .done (data) =>
      @setState data: data

    .fail (xhr, status, error) ->
      console.error @props.url, status, error.toSource()

  handleCommentSubmit: (comment) ->
    jq.ajax
      url: @props.url
      dataType: 'json'
      type: 'POST'
      data: comment
    .done (data) =>
      @setState data: data

    .fail (xhr, status, error) =>
      console.error @porps.url, status, error.toSource()

  componentDidMount: ->
    @fetchComments()
    setInterval @fetchComments.bind(this), @props.pollInterval

  render: ->
    commentList = $ CommentList, {data: @state.data}
    commentForm = $ CommentForm, {onCommentSubmit: @handleCommentSubmit.bind(this)}

    template commentList: commentList, commentForm: commentForm


module.exports = ContentBox
