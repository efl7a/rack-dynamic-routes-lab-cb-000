class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      puts item
      @@items.each do |item|
        puts "#{item} costs #{@@items[:item]}"
      end
      if @@items.include?(item)
        resp.write @@items["#{item}"]
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
