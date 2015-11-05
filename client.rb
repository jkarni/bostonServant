def get_anint(excon)
  excon.request(
    method: :get,
    path: "/anint",
    headers: {},
    body: nil
  )
end

def post_anint(excon, body)
  excon.request(
    method: :post,
    path: "/anint",
    headers: {},
    body: body
  )
end