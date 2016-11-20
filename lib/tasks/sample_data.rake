namespace :brandon do
  # Note for future: Consider using delete_all method to delete these in batches (doesn't invoke delete callbacks, though)
  desc "Clears out tours and checkins and supplies new ones to test ' tours in-progress' page"
  task :sample_data => :environment do
    puts "removing old tours and check-ins..."
    Tour.all.each do |t|
      t.delete
    end
    CheckIn.all.each do |c|
      c.delete
    end

    puts "making new tours..."
    Tour.create({
        house_id: 7,
        start_img: File.new("#{Rails.root}/app/assets/images/sample_images/jet1.jpg"),
        end_img: File.new("#{Rails.root}/app/assets/images/sample_images/jet2.jpg"),
        completed: true
      })

    Tour.create({
        house_id: 1,
        start_img: File.new("#{Rails.root}/app/assets/images/sample_images/enterprise.jpg")
      })

    puts "making new check-ins..."
    4.times do
      CheckIn.create({
          status: "sleep",
          tour_id: Tour.first.id,
          room_id: 40
        })
    end

    CheckIn.create({
        status: "awake",
        tour_id: Tour.last.id,
        room_id: 1
      })
  end
end
