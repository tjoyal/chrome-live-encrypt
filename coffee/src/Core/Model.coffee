namespace 'Core', (exports) ->

  class exports.Model extends exports.Persistence.LocalStorage


    @field: (name, options) ->
      @fields ?= {}
      @fields[name] = options || {}

    constructor: (attributes) ->
      @attributes = {}

      for name, options of @constructor.fields

        @attributes[name] = if attributes?[name]
          attributes?[name]
        else
          if typeof(options.default) == "function"
            options.default()
          else
            options.default

    get: (name) =>
      @attributes[name]

    set: (name, value) =>
      field = @constructor.fields[name]

      throw Error('Trying to set an non-existent property!') if not field

      # probably for hooks
      # return if value == @get(name)

      @attributes[name] = value
