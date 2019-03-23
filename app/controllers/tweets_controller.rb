require "csv"
class TweetsController < ApplicationController
    def new
        @errors = []
    end
    
    def create
        @errors = []
        if params[:name].empty?
            @errors << 'ユーザー名が未入力です。'
        end
        if params[:tweet].empty?
            @errors << 'つぶやき内容が未入力です。'
        end
        if params[:tweet].length > 140
            @errors << 'つぶやきは140文字以内で入力して下さい。'
        end
        if @errors.present?
            render 'new' and return
        end
        # CSVファイルに書き込みしている部分をコメントアウト
        # csv = CSV.open('tmp/tweets.csv','a')
        # time = Time.now
        # csv.puts([params[:name],params[:tweet], time.strftime('%Y/%m/%d %H:%M:%S')])
        # csv.close
        # redirect_to('/')
        # 以下6行を追加
        @tweet = Tweet.new(name: params[:name], tweet: params[:tweet])
        if @tweet.save
          redirect_to('/')
        else
          render 'new' and return
        end
    end
end
