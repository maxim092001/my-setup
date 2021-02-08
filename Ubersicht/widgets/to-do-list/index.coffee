refreshFrequency: 3000

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/ToDo.list'

command: "cat #{todolistfile} | awk 'BEGIN {print \"<ol>\"} /^[-]/ {print \"<li>\"substr($0,2)\"</li>\"} /^[+]/ {print \"<li class=\\\"completed\\\">\"substr($0,2)\"</li>\"} END {print \"</ol>\"}'"

style: """
  top: 30%
  left: 3%
  color: #fff
  font-family: Helvetica Neue

  h
    display: block
    text-align: center
    font-size: 24px
    font-weight: 100

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 12px
    text-align: center

  ol
    padding-left: 20px

  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)