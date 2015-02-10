BrandonApp.Routers.CheckIns = Backbone.Router.extend({

	initialize: function(options){
		console.log("this is the router initializer", this.$rootEl);
		this.$rootEl = options.$rootEl;
		this.rooms = options.rooms;
		this.tour = options.tour;
	},

	// issue is that 'new' needs to be default view for now, but that might screw things up later
	routes: {
		// 'check_ins/new': 'new'
		'': 'new'
	},

	new: function(){
		var newView = new BrandonApp.Views.CheckInRoom({
			collection: this.rooms
		});
		console.log("this is the new method");
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