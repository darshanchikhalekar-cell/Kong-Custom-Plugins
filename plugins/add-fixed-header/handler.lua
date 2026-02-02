local kong = kong

local AddFixedHeader = {
  PRIORITY = 800,
  VERSION = "1.0.0",
}

function AddFixedHeader:header_filter(conf)
  -- 🔒 Hardcoded header (no user input)
  kong.response.set_header("X-Demo-Plugin", "Enabled")
end

return AddFixedHeader
