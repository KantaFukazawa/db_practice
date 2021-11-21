require 'active_record'
require 'dotenv/load'

#PostgreSQLに接続する
ActiveRecord::Base.establish_connection(
    adapter:  ENV['myadapter'],
    host:     "",
    username: ENV['myusername'],
    password: "",
    database: ENV['mydatabase']
)
class Test < ActiveRecord::Base
end

# Displayクラス
class Display
  # 初期状態を定義する
  def initialize
    @raceno = "raceno"
    @events = "events"
    @groups = "groups"
    @rank1 = "rank1"
    @crew_rank1 = "crew_rank1"
    @rank2 = "rank2"
    @crew_rank2 = "crew_rank2"
    @rank3 = "rank3"
    @crew_rank3 = "crew_rank3"
    @rank4 = "rank4"
    @crew_rank4 = "crew_rank4"
    @rank5 = "rank5"
    @crew_rank5 = "crew_rank5"
    @rank6 = "rank6"
    @crew_rank6 = "crew_rank6"
  end
  #表示するためのメソッドを定義する
  def display(rows)
    rows.each do |row|
      puts "raceno: #{row[@raceno]} #{row[@events]} #{row[@groups]}"
      puts "#{row[@rank1]}着 #{row[@crew_rank1]}"
      puts "#{row[@rank2]}着 #{row[@crew_rank2]}"
      puts "#{row[@rank3]}着 #{row[@crew_rank3]}"
      puts "#{row[@rank4]}着 #{row[@crew_rank4]}"
      puts "#{row[@rank5]}着 #{row[@crew_rank5]}"
      puts "#{row[@rank6]}着 #{row[@crew_rank6]}"
    end
  end
end

# DBテーブルから全てのデータを呼び出す
records = Test.all
# Displayクラスのインスタンスを作る
race_results = Display.new
# DBのデータをターミナル/PowerShellに表示する
race_results.display(records)