$(".houses.index").ready(function(){
	BrandonApp.Views.HouseHour = Backbone.View.extend({
		template: JST["houses/hour"],

		tagName: "li",

		className: "small-12 columns small-centered accordion-navigation",

		events: {
			
		},

		initialize: function(options){
			this.tours = options.tours;
			this.hour = options.hour;
			this.counter = options.hourCounter;
			this.houseID = options.houseID;
			this.subViews = [];
		},

		render: function(){
			var that = this;

			this.sortTours();

			var content = this.template({
				hour: this.formatHour(this.hour),
				counter: this.counter,
				houseID: this.houseID,
				tours: this.tours
			});
			this.$el.html(content);

			for (var i = 1; i <= 4; i++){
				if (that.tours[i-1] && that.tours[i-1].get("timeslot") == i){
					var created_at = that.tours[i-1].get("created_at");
					var completed = that.tours[i-1].get("completed");
				} else {
					var created_at = "not started";
					var completed = "";
				}
				var subView = new BrandonApp.Views.HouseTour({
					created_at: created_at,
					completed: completed,
					hour: this.hour,
					timeslot: i
				});
				this.subViews.push(subView);
				this.$(".hour").append(subView.render().$el)
				// this.$el.append(subView.render().$el);	
			}

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