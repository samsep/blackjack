class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    if @canPlay
      if Math.min(@scores()[0],@scores()[1]) < 21
        console.log(@scores())
        @add(@deck.pop())
        @scoreCheck()

  stand: ->
    if @canPlay
      @gameOver()

  scoreCheck: ->
    if Math.min(@scores()[0],@scores()[1]) > 21
      @gameOver()

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  dealerReveal: ->
    @models[0].flip()
    @dealerPlay()

  dealerPlay: ->
    if @scores()[1] > 16 && @scores()[1] < 22
      @gameOver()
    else
      if Math.max(@scores()[0], @scores[1]) < 17 || Math.min(@scores()[0], @scores()[1]) < 17
        @hit()
        @dealerPlay()

  canPlay: true

  gameOver: ->
    @canPlay = false
    @trigger('gameOver')

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]


