local kong = kong

local StaticResponseHeader = {
  PRIORITY = 850,
  VERSION = "1.0.0",
}

function StaticResponseHeader:header_filter(conf)
  if conf and conf.headers then
    for k, v in pairs(conf.headers) do
      kong.response.set_header(k, v)
    end
  end
end

return StaticResponseHeader
