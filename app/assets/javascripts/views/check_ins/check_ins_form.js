BrandonApp.Views.CheckInForm = Backbone.View.extend({
	
	template: JST["check_ins/form"],

	tagName: "li",

	render: function(){
		var content = this.template({
			room_id: this.room_id
		});
		this.$el.html(content);
		return this;
	},

	leave: function(){
		this.remove();
	}
});