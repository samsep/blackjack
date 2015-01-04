class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="new-game">New Game</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
    <div class="chip-count-container"></div>
  '

  gameResTemp: _.template '
    <div class="gameState">Results</div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .new-game': ->
      @model.newGame()
      @render()



  initialize: ->
    @render()
    @model.on 'playerWin', => @renderWin()
    @model.on 'playerLoss', => @renderLoss()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.chip-count-container').html new ChipCountView(model: @model.get 'chipCount').el

  renderWin: ->
    @$el.append '<span class="results">You Won!</span>'
    @model.get('chipCount').addChip()
    console.log(@model.get('chipCount'))

  renderLoss: ->
    @$el.append '<span class="results">You Suck!</span>'
    @model.get('chipCount').subtractChip()
    console.log(@model.get('chipCount'))


