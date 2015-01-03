# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    # debugger;
    @set 'chipCount', chipCount = new ChipCount(10)
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'gameOver', => @get('dealerHand').dealerReveal()
    @get('dealerHand').on 'gameOver', => @results(@scoreCount(@get('playerHand')), @scoreCount(@get('dealerHand')))
    @

  reset: ->
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @get('playerHand').on 'gameOver', => @get('dealerHand').dealerReveal()
    @get('dealerHand').on 'gameOver', => @results(@scoreCount(@get('playerHand')), @scoreCount(@get('dealerHand')))

  results: (player, dealer) ->
    console.log(player)
    console.log(dealer)
    if player > 21
      @trigger('playerLoss')
    else if dealer > 21
      @trigger('playerWin')
    else if player > dealer
      @trigger('playerWin')
    else
      @trigger('playerLoss')

  scoreCount: (person) ->
    if person.scores()[1] < 22
       return person.scores()[1]
    else
       return person.scores()[0]


  newGame: ->
    count = @get('chipCount')

    if @get('deck').length > 12
      @reset()
    else
      @set 'deck', deck = new Deck()
      @reset()

    # @get('deck').
    # new AppView(model: new App()).$el.appendTo 'body'

