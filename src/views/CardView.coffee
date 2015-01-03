class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src= <%= image%> />'

  initialize: -> @render()

  render: ->
    if @model.get 'revealed'
      @$el.children().detach()
      cardName = "./img/cards/#{@model.attributes.rankName}-#{@model.attributes.suitName}.png"
      @model.attributes.image = cardName
      @$el.html @template @model.attributes
      console.log(cardName)
    else
      @$el.children().detach()
      cardName = "./img/card-back.png"
      @model.attributes.image = cardName
      @$el.html @template @model.attributes
      console.log(cardName)
    #@$el.addClass 'covered' unless @model.get 'revealed'

