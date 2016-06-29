#= require_tree .

$(document).ready ->

$.ajax
  url: document.location.protocol + '//ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=10&callback=?&q=' + encodeURIComponent('https://medium.com/feed/@allilevine')
  dataType: 'json'
  success: (data) ->
    if data.responseData.feed and data.responseData.feed.entries
      ul = document.getElementsByClassName('medium-articles')[0]
      docfrag = document.createDocumentFragment()
      $.each data.responseData.feed.entries, (i, e) ->
        li = document.createElement("li")
        $(li).html '<a href="' + e.link + '" target="_blank">' + e.title + '</a>'
        docfrag.appendChild li
        return
      ul.appendChild docfrag
    return

    $body = $('html, body')
    content = $('#main').smoothState(onStart:
      duration: 250
      render: ->
        content.toggleAnimationClass 'is-exiting'
        # Scroll user to the top
        $body.animate 'scrollTop': 0
        return
    ).data('smoothState')

return
