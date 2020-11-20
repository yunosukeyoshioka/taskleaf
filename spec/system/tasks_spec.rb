require 'rails_helper'

describe 'タスク管理機能', type: :system do
	describe '一覧表示機能' do
		let(:user_a) { FactoryBot.crate(:user, name: 'ユーザーA', email: 'a@example.com') }
		let(:user_b) { FactoryBot.crate(:user, name: 'ユーザーB', email: 'b@example.com') }


		before do
			FactoryBot.create(:task, name: '最初のタスク', user: user_a)
			visit login_path
			fill_in 'メールアドレス', with: 'login_user.email'
			fill_in 'パスワード', with: 'login_user.password'
			click_button 'ログインする'
		end

		# before do
		# 	#ユーザーAを作成しておく
		# 	user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
		# 	#作成者がユーザーAであるタスクを作成しておく
		# 	FactoryBot.create(:task, name: '最初のタスク', user: user_a)
		# end

		context 'ユーザーAがログインしているとき' do
			let(:login_user) { user_a }
			# before do
			# 	#ユーザーAでログインする
			# 	visit login_path
			# 	#メールアドレスを入力する
			# 	fill_in 'メールアドレス', with: 'a@example.com'
			# 	#パスワードを入力する
			# 	fill_in 'パスワード', with: 'password'
			# 	#ボタン
			# 	click_button 'ログインする'
			# end

			it 'ユーザーAが作成したタスクが表示される' do
				#作成ずみのタスクの名称が画面上に表示されていることを確認
				expect(page).to have_content '最初のタスク'
			end
		end

		context 'ユーザーBがログインしている時' do
			let(:login_user) { user_b }
			# before do
			# 	#ユーザーBを作成しておく
			# 	FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')
			# 	#ユーザーBでログインする
			# 	visit login_path
			# 	#メールアドレスを入力する
			# 	fill_in 'メールアドレス', with: 'b@example.com'
			# 	#パスワードを入力する
			# 	fill_in 'パスワード', with: 'password'
			# 	#ボタン
			# 	click_button 'ログインする'
			# end

			it 'ユーザーAが作成したタスクが表示されない'
				#ユーザーAが作成したタスクの名称が画面上に表示されないことを確認
				expect(page).to have_no_content '最初のタスク'
			end
		end
	end
end