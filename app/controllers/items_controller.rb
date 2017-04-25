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
          item= Item.new(read(result))
          #分かり易いようにItemとしてインスタンスを作成する。(保存はしていない)
          @item << item
          #itemを[]配列に追加している。
        end
    end
  end
  
  private
  
  def read(result)　#検索結果から必要な値を読み出して、最後に配列としてreturnしている。
    code=result.codename
    name=result['itemName']
    url =result.url
    image_url=result['mediumImageUrls'].first['imageUrl'].gsub('?_ex=128*128','')
    
    return{
      code: code,
      nam: name,
      url: url,
      image_url: image_url,
    }
  end
end
