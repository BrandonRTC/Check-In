$(".houses.index").ready(function(){
	BrandonApp.Views.HouseTour = Backbone.View.extend({
		template: JST["houses/tour"],

		tagName: "li",

		className: "panel",

		events: {

		},

		initialize: function(options){
			this.created_at = options.created_at;
		},

		render: function(){
			var content = this.template({
				created_at: this.created_at
			});
			this.$el.html(content);

			return this;
		}

	});
});