$(".houses.index").ready(function(){
	BrandonApp.Models.House = Backbone.Model.extend({
		//needs initializers to break down the bootstrapped tour data into new tour objects
		initialize: function(){

		}

		// parse: function(jsonResp){
		// 	if (jsonResp.tours) {
		// 		this.tours().set(jsonResp.tours);
		// 		delete jsonResp.tours;
		// 	}
		// 	return jsonResp;
		// },

		// tours: function(){
		// 	if (!this._tours) {
		// 		this._tours = new BrandonApp.Collections.Tours([],{
		// 			house: this
		// 		});
		// 	}
		// 	return this._tours;
		// }

	});
});