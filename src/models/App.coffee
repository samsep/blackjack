# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'gameOver', => @get('dealerHand').dealerReveal()
    @get('dealerHand').on 'gameOver', => @results(@scoreCount(@get('playerHand')), @scoreCount(@get('dealerHand')))
    @

  results: (player, dealer) ->
    console.log(player)
    console.log(dealer)
    if player > 21
      console.log('playerLoss')
      @trigger('playerLoss')
    else if dealer > 21
      console.log('playerWin')
      @trigger('playerWin')
    else if player > dealer
      console.log('playerWin')
      @trigger('playerWin')
    else
      console.log('playerLoss')
      @trigger('playerLoss')

  scoreCount: (person) ->
    console.log(person)
    if person.scores()[1] < 22
       return person.scores()[1]
    else
       return person.scores()[0]

