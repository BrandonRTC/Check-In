BrandonApp.Routers.CheckIns = Backbone.Router.extend({

	intialize: function(options){
		this.$rootEl = options.$rootEl;
		this.rooms = options.rooms;
		this.tour = options.tour;
	}

	routes: {
		'check_ins/new': 'new'
	},

	new: function(){
		var newView = new BrandonApp.View.CheckInRoom({
			collection: this.rooms
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
