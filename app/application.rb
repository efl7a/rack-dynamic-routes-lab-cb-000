class Application
  @@item = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      if @@item.include?(item)
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
    else
      resp.write "Page not found"
      resp.status = 404
    end
    resp.finish
  end
end
