$(".check_ins.new").ready(function(){
  window.BrandonApp = {
    Models: {},
    Collections: {},
    Views: {},
    Routers: {},
    initialize: function(roomsJSON, tourJSON, visitedJSON, $rootEl) {
    	BrandonApp.rooms = new BrandonApp.Collections.Rooms(roomsJSON);
    	BrandonApp.tour = new BrandonApp.Models.Tour(tourJSON);
    	BrandonApp.router = new BrandonApp.Routers.CheckIns({
    		$rootEl : $rootEl,
    		rooms : BrandonApp.rooms,
    		tour : BrandonApp.tour,
            visited : visitedJSON
    	});
    	Backbone.history.start();
    }
  };
});