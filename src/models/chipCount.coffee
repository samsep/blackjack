class window.ChipCount extends Backbone.Model
  initialize: (chips) ->
    console.log("chips:")
    console.log(chips)
    @set 'chipCount', chips

  addChip: ->
    @set 'chipCount', @get('chipCount')+ 1

  subtractChip: ->
    @set 'chipCount', @get('chipCount')- 1



