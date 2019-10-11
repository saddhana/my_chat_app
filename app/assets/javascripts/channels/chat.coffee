App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#dummy_message')
      .clone()
      .html("<div class='row no-gutters'><div class='col'><div class='message-content'><p class='mb-1'></p><p>" + data['message'] + "</p><p></p></div></div></div>")
      .appendTo($('#messages'));

  send_message: (data) ->
    @perform 'send_message', message: data