require 'rubygems'
require 'sinatra'
require 'http'

def influx_send(location,measurement,value)
  HTTP.post("http://localhost:8086/write?db=smartthings", :body=>"environment,location=#{location},measurement=#{measurement} value=#{value}")
end


class Tmonitor < Sinatra::Base
  get '/' do
    ""
  end

  get '/update/:unique_id/:device_name/:data_type/:value' do
    influx_send(params[:device_name],params[:data_type],params[:value])
    "device #{params[:device_name]}, type #{params[:data_type]}, value #{params[:value]}"
  end

  post '/config' do
    "success"
  end

  get '/status' do
    "fuck off bro"
  end

end

