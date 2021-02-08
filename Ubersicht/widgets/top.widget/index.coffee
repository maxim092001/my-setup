command: "./top.widget/script.sh | awk '{print $4, $10, $1, $2 \"<br>\"}'"

refreshFrequency: 1000

style: """
  top: 50%
  left: 3%
  color: #fff
  font-family: Helvetica Neue

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 15px
    text-align: center
"""

render: -> """
  <div class='top'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.top').html(output)