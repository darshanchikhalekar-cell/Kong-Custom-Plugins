return {
  name = "json-to-xml",
  fields = {
    {
      config = {
        type = "record",
        fields = {
          {
            root_tag = {
              type = "string",
              default = "root"
            }
          }
        }
      }
    }
  }
}
