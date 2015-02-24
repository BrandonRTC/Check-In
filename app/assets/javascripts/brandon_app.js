window.BrandonApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function(roomsJSON, tourJSON, $rootEl) {
    // maybe define rooms under 'BrandonApp.Collections' instead; figure out something with tour too
  	BrandonApp.rooms = new BrandonApp.Collections.Rooms(roomsJSON);
  	BrandonApp.tour = new BrandonApp.Models.Tour(tourJSON);
  	BrandonApp.router = new BrandonApp.Routers.CheckIns({
  		$rootEl : $rootEl,
  		rooms : BrandonApp.rooms,
  		tour : BrandonApp.tour
  	});
  	Backbone.history.start();
  }
};