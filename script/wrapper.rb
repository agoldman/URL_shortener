require 'launchy'

def wrapper
  # puts "Enter your screen name."
#   screen_name = gets.chomp
#   puts "Enter your email."
#   email = gets.chomp
#   u = User.create(:email => email, :username => screen_name)
#   puts "Enter your URL."
#   url = gets.chomp
#   u.create_url(url)
#   puts Url.where(:long_url => url)

  puts "Please enter your username"
  username = gets.chomp
  u = User.where(:username => username)[0]
  unless u
    puts "You are not in our database. Please enter your email to create a new account."
    email = gets.chomp
    u = User.create(:email => email, :username => username)
  end

  userinput = ""
  until userinput == "exit"
    puts "please enter:"
    puts "1. exit"
    puts "2. open"
    puts "3. shorten"
    puts "4. visits statistics"
    puts "5. visits by distinct users"
    puts "6. total visits within last 10 min."
    puts "7. my links"
    puts "8. comment on a link"
    userinput = gets.chomp
    break if userinput == "1"
    case userinput
    when "2"
      puts "Enter your short URL"
      url = gets.chomp
      Launchy.open(u.open(url))
    when "3"
      puts "Enter your long URL"
      url = gets.chomp
      u.create_url(url)
    when "4"
      puts "Please enter your short url"
      url = gets.chomp
      puts Url.where(:shortened_url => url)[0].visits
    when "5"
      puts "Please enter your short url"
      url = gets.chomp
      puts Url.where(:shortened_url => url)[0].distinct_visits
    when "6"
      puts "Please enter your short url"
      url = gets.chomp
      puts Url.where(:shortened_url => url)[0].ten_min_visits
    when "7"
      puts u.my_links
    when "8"
      puts "Please enter your short url"
      url = gets.chomp
      puts "Enter your comment"
      comment = gets.chomp
      u.make_comment(url, comment)
    end
  end
end

wrapper