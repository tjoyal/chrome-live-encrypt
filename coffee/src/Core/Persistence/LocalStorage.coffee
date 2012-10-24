namespace 'Core.Persistence', (exports) ->

  class exports.LocalStorage

    constructor: () ->

    save: ->
      elements = @.constructor.all()

      unless @.get('id')
        id = Math.floor(Math.random()*100000+1)
        @.set('id', id)

      future = []
      found = false
      for element in elements
        if element.id == @.get('id')
          future.push(@)
          found = true
        else
         future.push(element)

      unless found
        future.push(@)

      @.constructor.save_all(future)


    @all: ->
      str = localStorage.getItem("elements_" + @.name)

      # If undefined return a still valid value
      unless str
        return []

      elementAttributes = JSON.parse(str)
      elements = []
      for attributes in elementAttributes
        element = new @(attributes)
        elements.push(element)
      elements

    @destroy_all: ->
      @save_all([])

    @save_all: (elements) ->
      elementAttributes = []
      for element in elements
        attributes = element.attributes
        elementAttributes.push(attributes)
      str = JSON.stringify(elementAttributes)

      localStorage.setItem("elements_" + @.name, str )
