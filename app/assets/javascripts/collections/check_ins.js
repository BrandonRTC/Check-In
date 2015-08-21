$(".check_ins.new").ready(function(){
	BrandonApp.Collections.CheckIns = Backbone.Collection.extend({

	  model: BrandonApp.Models.CheckIn

	  // url: "api/check_ins"

	  // initialize: function(attribute){}

	});
});