describe "ChromeLiveEncrypt.KeyStore", ->



  beforeEach ->
    # nothing

  it "should be able to work even before initialization", ->
    keys = ChromeLiveEncrypt.KeyStore.get_keys()
    expect(keys).not.toBeUndefined()

  describe "considering we have a valid stack", ->

    @store

    beforeEach ->
      @store = ChromeLiveEncrypt.KeyStore
      @store.reset()

      for i in [1,2,3,4]
        key = key_factory(i)
        @store.add_key(key)

    it "should be contain some keys", ->
      expect(@store.get_keys().length).toBe(4)


    it "should be able to reset it", ->
      @store.reset()
      expect(@store.get_keys().length).toBe(0)

    it "should be able to find an item", ->
      expect( @store.find_by_name('not_existing') ).toBeUndefined()

      key = @store.find_by_name( 'Name1' )
      expect( key ).not.toBeUndefined()
      expect( key_factory_validation(key, 1) ).toBe(true)

    it "should be able to add an item", ->
      @store.add_key(key_factory(5))
      expect(@store.get_keys().length).toBe(5)

      key = @store.find_by_name( 'Name5' )
      expect( key ).not.toBeUndefined()
      expect( key_factory_validation(key, 5) ).toBe(true)
