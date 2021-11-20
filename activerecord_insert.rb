require 'active_record'
require 'dotenv/load'

ActiveRecord::Base.establish_connection(
  adapter: ENV['myadapter'],
  host:    "",
  username:ENV['myusername'],
  password:"",
  database:ENV['mydatabase']
)

class Test < ActiveRecord::Base
end

#  挿入するデータを配列に格納する
results = [
  [3,"男子シングルスカル","予選A",1,"クラブ3-1",2,"クラブ3-2",3,"クラブ3-3",4,"クラブ3-4",5,"クラブ3-5",6,"クラブ3-6"],
  [4,"女子シングルスカル","予選A",1,"クラブ4-1",2,"クラブ4-2",3,"クラブ4-3",4,"クラブ4-4",5,"クラブ4-5",6,"クラブ4-6"],
  [5,"女子クォドルプル","決勝",1,"クラブ5-1",2,"クラブ5-2",3,"クラブ5-3",4,"クラブ5-4",5,"クラブ5-5",6,"クラブ5-6"],
  [6,"男子エイト","決勝",1,"クラブ6-1",2,"クラブ6-2",3,"クラブ6-3",4,"クラブ6-4",5,"クラブ6-5",6,"クラブ6-6"]
]

# データをテーブルに挿入する
results.each do |result|
  Test.create(
    raceno: result[0],
    events: result[1],
    groups: result[2],
    rank1: result[3],
    crew_rank1: result[4],
    rank2: result[5],
    crew_rank2: result[6],
    rank3: result[7],
    crew_rank3: result[8],
    rank4: result[9],
    crew_rank4: result[10],
    rank5: result[11],
    crew_rank5: result[12],
    rank6: result[13],
    crew_rank6: result[14]
  )
end

#テーブルからデータを呼び出す
#全てのレコードを呼び出す
records = Test.all

#レコードごとにターミナル/PowerShellに表示する
records.each do |record|
  puts "raceno: #{record['raceno']} #{record['events']} #{record['groups']}"
  puts "#{record['rank1']}着 #{record['crew_rank1']}"
  puts "#{record['rank2']}着 #{record['crew_rank2']}"
  puts "#{record['rank3']}着 #{record['crew_rank3']}"
  puts "#{record['rank4']}着 #{record['crew_rank4']}"
  puts "#{record['rank5']}着 #{record['crew_rank5']}"
  puts "#{record['rank6']}着 #{record['crew_rank6']}"
end