local uuid = require "kong.tools.uuid"

local Plugin = {
  PRIORITY = 1000,
  VERSION = "1.0.0",
}

function Plugin:access(conf)
  local req_id = kong.request.get_header("X-Request-ID")

  if not req_id then
    req_id = uuid.uuid()
    kong.service.request.set_header("X-Request-ID", req_id)
  end
end

return Plugin
