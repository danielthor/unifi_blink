require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'json'

# hostname to look for
target_hostnames = ['iPhone-5s']
# consider recently connected if uptime within
recent_time = 60 * 2 # 2 minutes

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

# find recently connected target hostnames
connected_hosts.each do |hostname, uptime|
  if target_hostnames.include?(hostname)
    # temp: remove uptime check
    # and uptime <= recent_time
    # BLINK!
    blink_stick = BlinkStick.first
    blink_stick.blink(color: :red, blink: 10)
    blink_stick.color = :red
  end
end


