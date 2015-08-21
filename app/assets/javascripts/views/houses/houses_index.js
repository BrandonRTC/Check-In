$(".houses.index").ready(function(){
	BrandonApp.Views.HouseIndex = Backbone.View.extend({
		template: JST["houses/index"],

		events: {
			
		},

		initialize: function(options){
			this.houses = options.houses;
			this.tours = options.tours;
			this.subviews = [];
		},

		render: function(){
			var that = this;
			var content = this.template({
				houses: this.houses
			});
			this.$el.html(content);

			this.houses.each(function(house){
				var tours = that.tours.where({house_id: house.id});
				var view = new BrandonApp.Views.HouseShow({
					house: house,
					tours: that.tours
				});
				that.subviews.push(view)
				that.$el.append(view.render().$el);
			});
			return this;
		}

	});
});