describe("ChromeLiveEncrypt.Key", function() {
  var key;

  beforeEach(function() {

  });

  it("should be able to instanciate correctly", function() {
    key = new ChromeLiveEncrypt.Key();
    expect(key.id).not.toBeUndefined();
  });

  it("should be able to serialize/unserialize", function() {
    key1 = key_factory(1);
    skey1 = key1.serialize();
    key2 = ChromeLiveEncrypt.Key.unserialize(skey1)

    expect(key1.id).not.toBeUndefined();
    expect(key1.id).toEqual(key2.id);

    expect(key1.name).not.toBeUndefined();
    expect(key1.name).toEqual(key2.name);

    expect(key1.secret).not.toBeUndefined();
    expect(key1.secret).toEqual(key2.secret);

    expect(key1.note).not.toBeUndefined();
    expect(key1.note).toEqual(key2.note);
  });

//  describe("when song has been paused", function() {
//    beforeEach(function() {
//      player.play(song);
//      player.pause();
//    });
//
//    it("should indicate that the song is currently paused", function() {
//      expect(player.isPlaying).toBeFalsy();
//
//      // demonstrates use of 'not' with a custom matcher
//      expect(player).not.toBePlaying(song);
//    });
//
//    it("should be possible to resume", function() {
//      player.resume();
//      expect(player.isPlaying).toBeTruthy();
//      expect(player.currentlyPlayingSong).toEqual(song);
//    });
//  });
//
//  // demonstrates use of spies to intercept and test method calls
//  it("tells the current song if the user has made it a favorite", function() {
//    spyOn(song, 'persistFavoriteStatus');
//
//    player.play(song);
//    player.makeFavorite();
//
//    expect(song.persistFavoriteStatus).toHaveBeenCalledWith(true);
//  });
//
//  //demonstrates use of expected exceptions
//  describe("#resume", function() {
//    it("should throw an exception if song is already playing", function() {
//      player.play(song);
//
//      expect(function() {
//        player.resume();
//      }).toThrow("song is already playing");
//    });
//  });
});