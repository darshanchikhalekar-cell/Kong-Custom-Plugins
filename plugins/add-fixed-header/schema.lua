local typedefs = require "kong.db.schema.typedefs"

return {
  name = "add-fixed-header",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    {
      config = {
        type = "record",
        fields = {},     -- 🔒 no config fields
      },
    },
  },
}
