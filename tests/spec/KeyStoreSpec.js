describe("ChromeLiveEncrypt.KeyStore", function() {
  var key;

  beforeEach(function() {
  });

  it("should be able to work even before initialization", function() {
    keys = ChromeLiveEncrypt.KeyStore.get_keys()
    expect(keys).not.toBeUndefined();
  });

  describe("considering we have a valid stack", function() {

    var store;
    beforeEach(function() {
      store = ChromeLiveEncrypt.KeyStore;

      store.reset();

      for (i in [1,2,3,4]) {
        key = key_factory(i);
        store.add_key(key);
      }
    });

    it("should be contain some keys", function() {
      expect(store.get_keys().length).toBe(4);
    });

    it("should be able to reset it", function() {
      store.reset();
      expect(store.get_keys().length).toBe(0);
    });

    it("should be able to find an item", function() {

      expect( store.find_by_name('not_existing') ).toBeUndefined();

      key = store.find_by_name( 'Name1' );
      console.log(key);
      expect( key ).not.toBeUndefined();
      expect( key_factory_validation(key, 1) ).toBe(true);
    });

    it("should be able to add an item", function() {
      store.add_key(key_factory(5));
      expect(store.get_keys().length).toBe(5);

      key = store.find_by_name( 'Name5' );
      expect( key ).not.toBeUndefined();
      expect( key_factory_validation(key, 5) ).toBe(true);
    });
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