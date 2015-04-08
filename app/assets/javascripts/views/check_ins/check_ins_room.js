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

		// var room_id = parseInt($('#room_select').val());

		var room = this.collection.findWhere({room_name: name})
		var room_id = room.get("room_id");

		if (this.subViews.length > 0 || room_id === -1) {
			this.removeCheckInForms();
		}

		// var room = this.collection.get(room_id);
		var num_beds = room.get('num_beds');

		// look up alternative to 'for' loop (low priority)
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
		var checks = new BrandonApp.Models.CheckInWrapper({tour: this.tour});
		checks.set(attrs);

		checks.save({}, {
			success: function(model, resp){
				// console.log(resp);
				if (resp.redirect){
					// console.log(resp.redirect);
					// console.log("should redirect");
					window.location.replace(resp.redirect);
				} else {
					// console.log("success!");
					that.removeCheckInForms();
					Backbone.history.navigate("", {trigger: true});
				}
			},
			error: function(model, resp){
				alert(resp);
				// make this more robust
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