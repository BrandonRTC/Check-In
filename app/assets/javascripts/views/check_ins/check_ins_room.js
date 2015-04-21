BrandonApp.Views.CheckInRoom = Backbone.View.extend({
	template: JST["check_ins/room"],

	// event needs to be updated when QR scanner implemented
	events: {
		'change #room_select' : 'swapCheckInForms',
		'click #check_room' : 'submit',
	},

	initialize: function(options){
		this.subViews = [];
		this.tour = options.tour;
	},

	render: function(){
		var content = this.template({
			rooms: this.collection
		});
		this.$el.html(content);
		return this;
	},

	swapCheckInForms: function(name){
		var room = this.collection.findWhere({room_name: name})
		var room_id = room.get("id");
		var room_name = room.get("room_name");
		var num_beds = room.get('num_beds');

		if (this.subViews.length > 0 || room_id === -1) {
			this.removeCheckInForms();
		}
		
		$("#room-name").html(room_name);

		for (var i = 0; i < num_beds; i++) {
			var view = new BrandonApp.Views.CheckInForm({
				room_id: room_id
			});
			this.subViews.push(view);
			$("#check_in_list").append(view.render().$el);
		}
	},

	// useful for both switching the main view and for preparing for next room of check_ins
	removeCheckInForms: function(){
		_.each(this.subViews, function(subView){
			subView.leave();
		});
	},

	get_url: function(){
		return "/api/tours/" + this.tour.get("id") + "/check_ins"
	},

	// use to serialize json, make server calls, etc.
	// needs success callback that calls removeCheckInForms
	submit: function(event){
		event.preventDefault();
		var that = this;
		var attrs = $('form').serializeJSON();

		// makes use of wrapper model to submit multiple bed checks at once
		var checks = new BrandonApp.Models.CheckInWrapper({tour: this.tour});
		checks.set(attrs);

		checks.save({}, {
			success: function(model, resp){
				if (resp.redirect){
					window.location.replace(resp.redirect);
				} else {
					// grabs room_id from first bedcheck in wrapper model and uses it to highlight finished room
					var id = "#" + model.get("room").check_in[0].room_id;
					$(id).removeClass("custom");
					$(id).addClass("callout");
					that.removeCheckInForms();
					Backbone.history.navigate("", {trigger: true});
				}
			},
			error: function(model, resp){
				// MAKE THIS ROBUST
				console.log("the error response", resp);
			}
		});
	},

	// leave is for switching out the entire view
	// (e.g. for when you change to the index view when this is an actual one page app)
	leave: function(){
		this.removeCheckInForms();
		this.remove;
	}
});