# Active Recordとdotenvをrequireする
# requireの仕方は各々コードのとおり
# Active Recordを使う場合、Pgはインストールするだけでrequireしなくても大丈夫
require 'active_record'
require 'dotenv/load'

#環境変数を使って接続する
# 環境変数を使ってデーターベースと接続する
# メソッドはActiveRecord::Base.establish_connection
# adapter: 今回の場合はpostgresql
# host: 今回の場合は記入不要
# username:
# macOS10の場合、デフォルト設定だとOSのユーザー名
# Windows10の場合、デフォルト設定だとpostgres
# password: 設定している場合は記入する。Windows10版のデフォルト設定だと必要
# database: データーベース名を記入。今回はtest
ActiveRecord::Base.establish_connection(
    adapter:  ENV['myadapter'],
    host:     "",
    username: ENV['myusername'],
    password: "",
    database: ENV['mydatabase']
)

#Active Recordのclass(クラス)をつくる
# クラス名はデータベース名の一文字目を大文字にする。
# 今回の場合はTestになる
class Test < ActiveRecord::Base
end

#1行目のレコードを呼び出す
first_tests = Test.first
#全てのレコードを呼び出す
all_tests = Test.all

# pメソッドでレコードの詳細を表示
# レコードがハッシュに似たかたで呼び出されているのがわかる
puts "レコードの書式を表示"
p first_tests

# eachメソッドで1行ずつ呼び出す
# レコードの内容をカラム別に呼び出す
# 書式は変数名['カラム名']
# putsメソッドでターミナルに表示
puts "レコードの内容をカラム別に呼び出す"
all_tests.each do |alltest|
    puts "#{alltest['events']} #{alltest['groups']} #{alltest['rank1']}着 #{alltest['crew_rank1']}"
end