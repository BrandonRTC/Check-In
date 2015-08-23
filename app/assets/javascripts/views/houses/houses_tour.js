$(".houses.index").ready(function(){
	BrandonApp.Views.HouseTour = Backbone.View.extend({
		template: JST["houses/tour"],

		tagName: "li",

		className: "panel",

		events: {

		},

		initialize: function(options){
			this.created_at = options.created_at;
			this.completed = options.completed;
			this.hour = options.hour;
			this.minute = this.convertTimeSlot(options.timeslot);
			this.timeslot = (new Date()).setHours(this.hour, this.minute);
		},

		render: function(){
			var content = this.template({
				created_at: this.created_at
			});
			this.$el.html(content);
			var status = this.getStatus();
			// this.$el.addClass("callout");
			return this;
		},

		getStatus: function(){
			var date = new Date();
			var diff = date - this.timeslot;
			var quarterHour = 90000;

			if (this.created_at == "not started"){
				if (diff <= quarterHour) {
					return "tour-not-started";
				} else if (diff > quarterHour && diff < (diff * 2)) {
					return "tour-late";
				} else {
					return "tour-incomplete";
				}
			} else {
				if (this.completed == "true") {
					return "tour-complete";
				} else {
					return "tour-in-progress";
				}
			}
		},

		convertTimeSlot: function(slot){
			return (slot * 15) - 15;
		}

	});
});