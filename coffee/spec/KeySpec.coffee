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


describe "testing key2", ->

  beforeEach ->
    ChromeLiveEncrypt.Key2.destroy_all()

  it "should be none keys at the start", ->
    all = ChromeLiveEncrypt.Key2.all()
    expect( all.length ).toBe( 0 )

  it "should persist data correctly", ->

    key = new ChromeLiveEncrypt.Key2()
    key.set('name', 'test1')
    key.set('secret', 'test2')

    expect( key.get("id") ).toBeUndefined()
    key.save()
    expect( key.get("id") ).not.toBeUndefined()

    all = ChromeLiveEncrypt.Key2.all()
    expect( all.length ).toBe( 1 )

    persisted = all[0]
    expect( key.get('id') ).toBe( persisted.get('id'))

    expect( persisted.get('name') ).toBe( key.get('name'))
    expect( persisted.get('name') ).toBe("test1")

    expect( persisted.get('secret') ).toBe( key.get('secret'))
    expect( persisted.get('secret') ).toBe("test2")


