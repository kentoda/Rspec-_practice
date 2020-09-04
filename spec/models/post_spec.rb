require 'rails_helper'

# describe：Postモデルをテスト対象にすることを示している。
RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  # context ：データが正しく保存できることに関するテストであることを示している。
  context "データが正しく保存されている" do
  	# before ：テスト用のデータを生成している。
  		before do
  			@post = Post.new
  			@post.title = "hellow"
  			@post.content = "こんにちは"
  			@post.save
  		end
  		it "全て入力してあるので保存される" do
  			# expect(@post).to：saveされているデータが入っている変数を示している。
  			# be_valid：@postに正しくデータが保存されているかを確認する
  			expect(@post).to be_valid
  		end
	end
	# context ：データが正しく保存されないことに関するテストであることを示している。
	context "データが正しく保存されない" do
		# before ：テスト用のデータを生成している。(今回はtitleを空にしてある。)
		before do
			@post = Post.new
			@post.title = ""
			@post.content = "こんにちは"
			@post.save
		end
		it "titleが正しく入力されていないので保存されない" do
			# be_invalid：先ほどとは逆で@postに正しくデータが保存されていないことを確認する。
			expect(@post).to be_invalid
			# expect(@post.errors [:title])：@postに対してのエラーメッセージはerrorsに配列として入り、その中でも今回はtitleカラムを対象としている為このような記述となる。
			# include("can't be blank")：'presence: true'のバリデーションをかけた場合のエラーメッセージに"can't be blank"が含まれているか確認
			expect(@post.errors[:title]).to include("can't be blank")
        end
    end
end
