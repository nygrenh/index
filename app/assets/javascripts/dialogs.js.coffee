$(document).ready ->
  prettyConfirmBox = (message, callback) ->
    bootbox.dialog
      message: message
      buttons:
        no:
          label: "No"
          className: "btn-default"
        yes:
          label: "Yes"
          className: "btn-primary"
          callback: ->
            callback()

  $.rails.allowAction = (element) ->
    message = element.data("confirm")
    answer = false
    callback = undefined
    return true unless message

    if $.rails.fire(element, "confirm")
      prettyConfirmBox message, ->
        callback = $.rails.fire(element, "confirm:complete", [answer])
        if callback
          oldAllowAction = $.rails.allowAction
          $.rails.allowAction = ->
            true

          element.trigger "click"
          $.rails.allowAction = oldAllowAction

    false
