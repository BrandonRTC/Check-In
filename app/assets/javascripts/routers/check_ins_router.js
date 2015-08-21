$(".check_ins.new").ready(function(){
	BrandonApp.Routers.CheckIns = Backbone.Router.extend({

		initialize: function(options){
			this.$rootEl = options.$rootEl;
			this.rooms = options.rooms;
			this.tour = options.tour;
			this.visited = options.visited;
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
				tour: this.tour,
				roomsVisited: this.visited
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
			this._highlightRoooms();
			this.currentView = newView;
		},

		_highlightRoooms: function(){
			if (this.visited.length > 0) {
				this.visited.forEach(function(room_id){
					id = "#" + room_id;
					$(id).removeClass("custom");
					$(id).addClass("callout");
				});
			}
		}

	});
});