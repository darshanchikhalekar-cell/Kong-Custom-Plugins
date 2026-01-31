local typedefs = require "kong.db.schema.typedefs"

return {
  name = "static-response-header",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    {
      config = {
        type = "record",
        fields = {
          {
            headers = {
              type = "map",
              keys = { type = "string" },
              values = { type = "string" },
              required = false,   -- 🔴 IMPORTANT CHANGE
            },
          },
        },
        default = {
          headers = {},          -- allow empty config
        },
      },
    },
  },
}
