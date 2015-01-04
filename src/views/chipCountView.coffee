class window.ChipCountView extends Backbone.View

  # template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @render()
    @model.on 'change', => @render()



  render: ->
    @$el.text("Chip Count:" + " #{@model.get('chipCount')}")
    console.log(@$el)
