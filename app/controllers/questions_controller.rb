require "csv"
class QuestionsController < ApplicationController
    def new
        @errors = []
    end
    def create
        @errors = []
        if params[:name].empty?
            @errors << '名前が未入力です。'
        end
        if params[:email].empty?
            @errors << 'メールアドレスが未入力です。'
        end
        if params[:question].empty?
            @errors << 'お問い合わせ内容が未入力です。'
        end
        if params[:question].length > 500
            @errors << 'お問い合わせは500文字以内で入力して下さい。'
        end
        if @errors.present?
            render 'new' and return
        end
        csv = CSV.open('tmp/questions.csv','a')
        time = Time.now
        csv.puts([params[:name],params[:email],params[:question], time.strftime('%Y/%m/%d %H:%M:%S')])
        csv.close
        redirect_to('/')
    end
end

