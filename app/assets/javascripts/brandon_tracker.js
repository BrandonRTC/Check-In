$(".houses.index").ready(function(){
	window.BrandonApp = {
		Models: {},
		Collections: {},
		Views: {},
		Routers: {},
		initialize: function(housesJSON, toursJSON, $rootEl){
			BrandonApp.houses = new BrandonApp.Collections.Houses(housesJSON);
			BrandonApp.tours = new BrandonApp.Collections.Tours(toursJSON);
			BrandonApp.router = new BrandonApp.Routers.Houses({
				$rootEl: $rootEl
			});
			Backbone.history.start();
		}
	}
});