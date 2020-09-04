require 'rails_helper'

# RSpec.describe "Posts"：PostsControllerをテスト対象にすることを示している
# describe：新規投稿ページの関するテストであることを示している。
RSpec.describe "Posts", type: :request do
	describe '新規投稿ページ' do
		# context ：新規投稿ページの正しく表示されることに関するものをまとめる。
		context "新規投稿ページが正しく表示される" do
			# before ：今回は' get posts_new_path 'で新規投稿ページを表示する処理をitの前に行う。
			before do
				get posts_new_path
			end
			it 'リクエストは200 OKとなること' do
				# response.status：この記述することでレスポンスステータスが受け取ることができる。
				# eq ：表示成功した時のレスポンスステータスの' 200 'を記述している
				expect(response.status).to eq 200
			end
			it 'タイトルが正しく表示されていること' do
				# response.body：htmlのデータが入っている
				# include：()の中身が含まれているか検証している
				expect(response.body).to include('新規投稿')
		    end
		end
	end
end
