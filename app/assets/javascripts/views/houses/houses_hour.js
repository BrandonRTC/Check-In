$(".houses.index").ready(function(){
	BrandonApp.Views.HouseHour = Backbone.View.extend({
		template: JST["houses/hour"],

		tagName: "ul",

		className: "small-12 columns small-centered",

		events: {
			
		},

		initialize: function(options){
			this.tours = options.tours;
			this.hour = this.formatHour(options.hour);
			// console.log("options.hour", options.hour);
			console.log("this.hour", this.hour);
			this.subViews = [];
		},

		render: function(){
			var that = this;
			this.sortTours();
			var content = this.template({
				hour: this.hour,
				tours: this.tours
			});
			this.$el.html(content);

			for (var i = 1; i <= 4; i++){
				if (that.tours[i-1]){
					var created_at = that.tours[i-1].get("created_at");
					//create other custom variables for template here (late, in progress, complete)
				} else {
					var created_at = "not started";
					//logic for missed or not started here
				}
				var subView = new BrandonApp.Views.HouseTour({
					created_at: created_at
				});
				this.subViews.push(subView);
				this.$el.append(subView.render().$el);
			}

			// for (var i = 1; i <= 4; i++){
			// 	if (this.tours[i-1] && this.tours[i-1].timeslot == 1) {
			// 		var subView = new BrandonApp.Views.HouseTour({});
			// 	} else {
					
			// 	}
			// }

			return this;
		},

		setStatus: function(){
			// jquery to grab tour elements
			// logic to figure out status of tour (not started, late, on time, complete, etc)
			// set classes for css to determine background color
		},

		sortTours: function(){
			this.tours.sort(function(a, b){
				if (a.timeslot > b.timeslot){
					return 1;
				}
				if (a.timeslot < b.timeslot){
					return -1;
				}
				return 0;
			});
		},

		formatHour: function(hour){
			var time = ""
			if (hour > 12){
				time = hour % 12 + ":00pm"
			} else if (hour != 0 && hour < 12){
				time = hour % 12 + ":00am";
			} else if (hour == 12){
				time = hour + ":00pm";
			} else {
				time = "12:00am";
			}
			return time;
		}

	});
});