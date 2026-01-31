local kong = kong

local StaticResponseHeader = {
  PRIORITY = 850,
  VERSION = "1.0.1",
}

-- 🔒 HARDCODED DEFAULT HEADERS
local DEFAULT_HEADERS = {
  ["X-Environment"] = "UAT",
  ["X-Gateway"] = "Kong",
}

function StaticResponseHeader:header_filter(conf)
  -- Use config headers if present, else defaults
  local headers = conf.headers or DEFAULT_HEADERS

  for k, v in pairs(headers) do
    kong.response.set_header(k, v)
  end
end

return StaticResponseHeader
