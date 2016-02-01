class AtomTfsView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('atomTfs')

    message = document.createElement('div')
    message.textContent = "Pending changes (soon !)"
    @element.appendChild(message)

    # Create message element
    # message = document.createElement('div')
    # message.textContent = "The Wordcount package is Alive! It's ALIVE!"
    # message.classList.add('message')
    # @element.appendChild(message)

  serialize: ->

  destroy: ->
    @element.remove()

  getElement: ->
    @element

module.exports = AtomTfsView
