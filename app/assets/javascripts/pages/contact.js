$("#new_message").on("ajax:success", function(event, data, status, xhr) { 
	$("#new_message").prepend("<%=j( render partial: 'layouts/error_messages', object: f.object) %>")
});