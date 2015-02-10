BrandonApp.Views.CheckInRoom = Backbone.View.extend({
	template: JST["check_ins/room"],

	// event needs to be updated when QR scanner implemented
	events: {
		'change #check_in_room_select' : 'addCheckInForms',
		'click button' : 'submit',
	},

	initialize: function(){
		this.subViews = [];
	},

	render: function(){
		var content = this.template({
			rooms: this.collection
		});
		this.$el.html(content);
		return this;
	},

	addCheckInForms: function(){

		var room_name = $('#room_select').val();
		var room = this.collection.findWhere({name: room_name});
		var num_rooms = room.get('num_rooms');
		var id = room.get('id');

		for (var i = 0; i < num_rooms; i++) {
			var view = new BrandonApp.Views.CheckInForm({
				room_id: id
			});
			this.subViews.push(view);
			$("#check_in_list").append(view.render.$el);
		}
	},

	// useful for both switching the main view and for preparing for next room of check_ins
	removeCheckInForms: function(){
		_.each(this.subViews, function(subView){
			subView.leave();
		});
	},

	// use to serialize json, make server calls, etc.
	// needs success callback that calls removeCheckInForms
	submit: function(){

	},

	// leave is for switching out the entire view (e.g. for when you change to the index view or w/e)
	leave: function(){
		this.removeCheckInForms();
		this.remove;
	}
});