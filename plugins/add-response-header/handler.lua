local Plugin = {
  PRIORITY = 1000,
  VERSION = "1.0.0"
}

function Plugin:header_filter(conf)
  kong.response.set_header("X-Kong-Custom-Plugin", "add-response-header")
end

return Plugin
