class window.ChipCountView extends Backbone.View

  # template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    console.log('chip init')
    @render()
    @model.on 'change', => @render()



  render: ->
    @$el.text("chip count:" + " #{@model.get('chipCount')}")
    console.log(@$el)
