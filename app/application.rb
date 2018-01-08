class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.each do |item|
        puts item.name
        puts item.price
      end
      item_requested = req.path.split("/items/").last
      puts item_requested
      if @@items.any?(item_requested)
        @@items.each do |item|
          if item == item_requested
            resp.write item.name
            resp.write item.price
          end
        end
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
