$(".houses.index").ready(function(){
	BrandonApp.Views.HouseShow = Backbone.View.extend({
		template: JST["houses/show"],

		tagName: "div",

		className: "panel row custom house small-2",

		events: {
			
		},

		initialize: function(options){
			this.model = options.house;
			this.collection = options.tours;
			this.subviews = [];
		},

		render: function(){
			var that = this;
			var content = this.template({
				house: this.model
			});
			this.$el.html(content);
			for(var i = 0; i < 15; i++){
				var toursHour = this.getTours(i);
				var tours = toursHour[0];
				var hour = toursHour[1];
				var view = new BrandonApp.Views.HouseHour({
					tours: tours,
					hour: hour,
					hourCounter: i,
					houseID: this.model.get("id")
				});
				this.subviews.push(view);
				this.$(".shift").append(view.render().$el);
				// this.$el.append(view.render().$el);
			}
			return this;
		},

		getTour: function(hour){
			var tours = [];
			this.collection.each(function(tour){
				var rawTime = tour.get("created_at");
				var time = new Date(rawTime);
				if (time.getHours >= hour && time.getHours < hour + 1){
					tours.push(tour);
				}
			})
			return tours;
		},

		getTours: function(i){
			switch(i){
				case 0:
					return [this.getTour(18), 18];
					break
				case 1:
					return [this.getTour(19), 19];
					break
				case 2:
					return [this.getTour(20), 20];
					break
				case 3:
					return [this.getTour(21), 21];
					break
				case 4:
					return [this.getTour(22), 22];
					break
				case 5:
					return [this.getTour(23), 23];
					break
				case 6:
					return [this.getTour(0), 0];
					break
				case 7:
					return [this.getTour(1), 1];
					break
				case 8:
					return [this.getTour(2), 2];
					break
				case 9:
					return [this.getTour(3), 3];
					break
				case 10:
					return [this.getTour(4), 4];
					break
				case 11:
					return [this.getTour(5), 5];
					break
				case 12:
					return [this.getTour(6), 6];
					break
				case 13:
					return [this.getTour(7), 7];
					break
				case 14:
					return [this.getTour(8), 8];
					break
				default:
					return [];
					break
			}
		}
	});
});