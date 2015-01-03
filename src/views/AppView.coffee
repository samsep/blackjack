class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  gameResTemp: _.template '
    <div class="gameState">Results</div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()



  initialize: ->
    @render()
    @model.on 'playerWin', => @renderWin()
    @model.on 'playerLoss', => @renderLoss()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  renderWin: ->
    @$el.append '<span>You Won!</span>'

  renderLoss: ->
    @$el.append '<span>You Suck!</span>'

