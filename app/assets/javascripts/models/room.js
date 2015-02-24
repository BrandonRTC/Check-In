BrandonApp.Models.Room = Backbone.Model.extend({

	// this could straight up be the wrapper for the checkins
	// read back into the wrapper model way of persisting multiple items at once

	// might feel a little odd, as the url will route to the check ins router, but shouldn't matter
	// since the server rooms are basically static, just need to sanitize the room data from the model

	// alternatively, just write a checkInWrapper model; it might be less potentially confusing
	
});