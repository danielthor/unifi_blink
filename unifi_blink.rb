require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'json'

# hostname(s) to look for, colors to blink
targets = {
  'iPhone-5s' => { color: :blue },
  'Anders' => { color: :red }
}
# consider recently connected if uptime under
recent_time = 60 # 1 minute

base_url = "https://<ap controler hostname>:8443"
username = ""
password = ""

# login to get session id
login_request = HTTPI::Request.new
# we are unsecure
login_request.auth.ssl.verify_mode = :none
login_request.open_timeout = 5
login_request.url = "#{base_url}/login"
login_request.query = { login: 'login', username: username, password: password }
login_response = HTTPI.get(login_request)
# format: "unifisession=83414528DB91EA04F014CCCB1780C05C; Path=/; Secure"
session_id = login_response.headers['set-cookie'].split('; ')[0]

# connect to blink stick
blink_stick = BlinkStick.first

loop do

  begin
    # now we have session id, get data

    data_request = HTTPI::Request.new
    # again, we are unsecure
    data_request.auth.ssl.verify_mode = :none
    data_request.open_timeout = 5
    data_request.url = "#{base_url}/api/stat/sta"
    data_request.headers = { 'Cookie' => session_id }
    data_response = HTTPI.get(data_request)

    # we have data, parse it
    parsed_data = JSON.parse(data_response.body)

    # collect connected hosts and uptime
    connected_hosts = parsed_data['data'].collect { |c| [c['hostname'], c['_uptime']]  }

    target_found = 0

    # find recently connected target hostnames
    connected_hosts.each do |hostname, uptime|
      if targets.keys.include?(hostname) and uptime <= recent_time
        puts "#{hostname} found! BLINK!"
        target_found = 1
        blink_stick.blink(color: targets[hostname][:color], blink: 10)
        blink_stick.off
      end
    end

    puts "No (new) targets found. Sleepig..." if target_found == 0
  rescue Exception => e
    puts "EXCEPTION! #{e}"
    puts "Gotta catch em' all! Continuing..."
  end

  sleep 20
end
