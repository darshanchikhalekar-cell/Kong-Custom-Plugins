local cjson = require "cjson.safe"

local Plugin = {
  PRIORITY = 1000,
  VERSION = "1.0.0"
}

-- Fixed XML root tag (Git-controlled)
local ROOT_TAG = "request"

-- Convert JSON table to XML
local function table_to_xml(tbl)
  local xml = "<" .. ROOT_TAG .. ">"
  for k, v in pairs(tbl) do
    xml = xml .. "<" .. k .. ">" .. tostring(v) .. "</" .. k .. ">"
  end
  xml = xml .. "</" .. ROOT_TAG .. ">"
  return xml
end

function Plugin:access(conf)
  local body = kong.request.get_raw_body()
  if not body then
    return
  end

  local json_tbl = cjson.decode(body)
  if not json_tbl then
    return kong.response.exit(400, {
      message = "Invalid JSON payload"
    })
  end

  local xml_body = table_to_xml(json_tbl)

  kong.service.request.set_header("Content-Type", "application/xml")
  kong.service.request.set_raw_body(xml_body)
end

return Plugin
