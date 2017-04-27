class ItemsController < ApplicationController
  def new
    @items = []
    #@itemsをカラ配列として初期化。ここに値が入るのは検索ワードが入力されたときのみ。
    
    @keyword = params[:keyword]
    #フォームから送信される検索ワードを取得している。
    if @keyword
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        imageFlag: 1,
        hits: 20,
      })
      results.each do |result|
        item = Item.find_or_initialize_by(read(result))
        #分かり易いようにItemとしてインスタンスを作成する。(保存はしていない)
        @items << item
        #itemを[]配列に追加している。
      end
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @want_users= @item.want_users
    @have_users= @item.have_users
  end
end
