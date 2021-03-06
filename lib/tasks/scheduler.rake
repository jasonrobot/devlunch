task :pick => :environment do
  time = Time.now
  if time.friday? || Rails.env.development? then
    @winner = Winner.new
    id = User.where(plus_one: true).sample.id
    @winner.user_id = id
    @winner.save
    Pick.first.update done: true
  end
end

task :reset => :environment do
  time = Time.new
  if time.monday? || Rails.env.development? then
    User.update_all "coming = 'false', plus_one = 'false'"
    Pick.first.update done: false
  end
end
