command: "./top.widget/script.sh | awk '{
  print 
  \"<tr>\"
  \"<th>\"$4\"</th>\",
  \"<th>\"$10\"</th>\",
  \"<th>\"$1\"</th>\",
  \"<th>\"$2\"</th>\"
   \"</tr>\"
}'"
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
  <div class='top'>
    <table class='table'>

    </table>
  </div>
"""

update: (output, domEl) ->
  $(domEl).find('.table').html(output)