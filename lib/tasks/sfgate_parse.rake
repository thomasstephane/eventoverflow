require 'xmlsimple'

desc "Import SFGate tech events"
task :import_list => :environment do 
  a = Mechanize.new
  a.get("http://events.sfgate.com/search?cat=3&new=n&rss=1&sort=0&srad=85.0&srss=10&st=event&st_select=event&swhat=&swhen=&swhere=San+Francisco%2C+CA")
  xml = a.page.body
  status = XmlSimple.xml_in(xml)

  events = status["channel"][0]["item"]

def duration_calc(dstart,dend)
  if dstart && dend
    (dend - dstart) / 3600
  else
    0
  end
end

  events.each do |event|
    extern_id = event["id"][0]
    title = event["title"][0]
    description = event["description"][0] if event["description"][0] != {} 
    phone = event["phone"][0] if event["phone"][0] != {} 
    guid = event["guid"][0] if event["guid"][0] != {} 
    link = event["link"][0] if event["link"][0] != {} 
    creator = event["creator"][0] if event["creator"][0] != {} 
    lat = event["lat"][0] if event["lat"][0] != {} 
    long = event["long"][0] if event["long"][0] != {} 
    starts_at = Time.parse(event["dtstart"][0]) if event["dtstart"][0] != {} 
    dtend = Time.parse(event["dtend"][0]) if event["dtend"][0] != {} 
    venue_name = event["x-calconnect-venue"][0]['adr'][0]["x-calconnect-venue-name"][0]
    street = event["x-calconnect-venue"][0]['adr'][0]["x-calconnect-street"][0]
    city = event["x-calconnect-venue"][0]['adr'][0]["x-calconnect-city"][0]
    region = event["x-calconnect-venue"][0]['adr'][0]["x-calconnect-region"][0]
    zip = event["x-calconnect-venue"][0]['adr'][0]["x-calconnect-postalcode"][0]
    country = event["x-calconnect-venue"][0]['adr'][0]["x-calconnect-country"][0]
    image_url = (event["image"][0]["url"][0] if event["image"][0]["url"]) if event["image"]
    Event.create(
      :user_id => 4,
      :extern_id => extern_id.to_i,
      :title => title.gsub("Event: ",""),
      :description => description,
      :phone => phone,
      :guid => guid,
      :link => link,
      :creator => creator,
      :lat => lat,
      :long => long,
      :starts_at => starts_at,
      :duration => duration_calc(starts_at,dtend),
      :venue_name => venue_name,
      :street => street,
      :city => city,
      :region => region,
      :zip => zip.to_i,
      :country => country,
      :image_url => image_url
    )
  end
end
