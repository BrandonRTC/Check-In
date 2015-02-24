BrandonApp.Routers.CheckIns = Backbone.Router.extend({

	initialize: function(options){
		this.$rootEl = options.$rootEl;
		this.rooms = options.rooms;
		this.tour = options.tour;
	},

	// issue is that 'new' needs to be default view for now, but that might screw things up later
	routes: {
		// 'check_ins/new': 'new'
		"": 'new'
	},

	// need to decide whether to have the rooms or the checkins as the collection (probably checkins)
	
	new: function(){
		var newView = new BrandonApp.Views.CheckInRoom({
			collection: this.rooms,
			tour: this.tour
			// collection: new BrandonApp.Collections.CheckIns(),
			// model: new BrandonApp.Models.CheckIn()
		});
		return this._swapView(newView)
	},

	_swapView: function(newView){
		if (this.currentView) {
			this.currentView.remove();
		}
		this.$rootEl.html(newView.render().$el);
		this.currentView = newView;
	}

});