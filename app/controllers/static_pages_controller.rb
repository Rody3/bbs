class StaticPagesController < ApplicationController
  def top
    # 以下２行をコメントアウト
    # csv = CSV.read('tmp/tweets.csv')
    # @tweets = csv
    @tweets = Tweet.all   # この1行を追加
  end
end
