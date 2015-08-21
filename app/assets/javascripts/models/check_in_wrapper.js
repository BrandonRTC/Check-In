$(".check_ins.new").ready(function(){
	BrandonApp.Models.CheckInWrapper = Backbone.Model.extend({

		urlRoot: function(){
			return "/api/tours/" + this.tour_id + "/check_ins";
		},

		initialize: function(options){
			this.tour_id = options.tour.get("id");
		}
		
	});
});