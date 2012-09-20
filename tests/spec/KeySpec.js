describe("ChromeLiveEncrypt.Key", function() {
  var key;

  beforeEach(function() {
    key = new ChromeLiveEncrypt.Key(1);
    key.name = 'Name1';
    key.secret = 'Secret1';
    key.note = 'Note1';
  });

  it("should be able to instanciate correctly", function() {
    id = 5;
    key = new ChromeLiveEncrypt.Key(id);
    expect(key.id).toEqual(id);
  });

  it("should be able to serialize/unserialize", function() {
    key1 = key;
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