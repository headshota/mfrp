class TestsController < ApplicationController

  def index
    attributes = [:f1_name, :f1_wins, :f1_losses, :f2_name, :f2_wins, :f2_losses]
    training = [
      ['1', 1, 0, '2', 0, 0, 1],
      ['2', 0, 0, '1', 1, 0, 2],

      ['1', 1, 0, '2', 200, 0, 2],
      ['2', 200, 0, '1', 1, 0, 1],
    ]
    dec_tree = DecisionTree::ID3Tree.new(attributes, training, 0, f1_name: :discrete, f1_wins: :continious, f1_losses: :continious, f2_name: :discrete, f2_wins: :continious, f2_losses: :continious)
    dec_tree.train


    test = [ '1', 150, 0, '2', 100, 100 ]


    decision = dec_tree.predict(test)

    render plain: "Predicted: #{decision} "
  end
end
