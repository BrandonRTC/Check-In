$(".houses.index").ready(function(){
	BrandonApp.Routers.Houses = Backbone.Router.extend({

		routes: {
			"": "index"
		},

		initialize: function(options){
			this.$rootEl = options.$rootEl
		},

		index: function(){
			var newView = new BrandonApp.Views.HouseIndex({
				houses: BrandonApp.houses,
				tours: BrandonApp.tours,
			});
			return this._swapView(newView);
		},

		_swapView: function(newView){
			if (this.currentView){
				this.currentView.remove();
			}
			this.$rootEl.html(newView.render().$el)
			this.currentView = newView;
		}
	});
});