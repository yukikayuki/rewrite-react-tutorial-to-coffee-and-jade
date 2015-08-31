{React} = require 'vendor'
jade = require 'react-jade'

template = jade.compileFile "#{__dirname}/template.jade"

class CommentForm extends React.Component
  handleSubmit: (e) ->
    e.preventDefault()

    elAuthor = React.findDOMNode this.refs.author
    elText = React.findDOMNode this.refs.text

    author = elAuthor.value.trim()
    text = elText.value.trim()

    @props.onCommentSubmit author: author, text: text

    elAuthor.value = ''
    elText.value = ''

  render: ->
    template handleSubmit: @handleSubmit.bind(this)

module.exports = CommentForm
