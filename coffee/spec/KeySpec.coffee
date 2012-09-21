describe "ChromeLiveEncrypt.Key", ->

  beforeEach ->
    # nothing

  it "should be able to instanciate correctly", ->
    key = new ChromeLiveEncrypt.Key()
    expect(key.id).not.toBeUndefined()

  it "should be able to serialize/unserialize", ->
    key1 = key_factory(1)
    skey1 = key1.serialize()
    key2 = ChromeLiveEncrypt.Key.unserialize(skey1)

    expect(key1.id).not.toBeUndefined()
    expect(key1.id).toEqual(key2.id)

    expect(key1.name).not.toBeUndefined()
    expect(key1.name).toEqual(key2.name)

    expect(key1.secret).not.toBeUndefined()
    expect(key1.secret).toEqual(key2.secret)

    expect(key1.note).not.toBeUndefined()
    expect(key1.note).toEqual(key2.note)
