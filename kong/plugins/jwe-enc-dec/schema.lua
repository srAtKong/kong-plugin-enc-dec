local typedefs = require "kong.db.schema.typedefs"

-- Grab pluginname from module name
local plugin_name = ({...})[1]:match("^kong%.plugins%.([^%.]+)")

local schema = {
  name = plugin_name,
  fields = {
    -- the 'fields' array is the top-level entry with fields defined by Kong
    { consumer = typedefs.no_consumer },  -- this plugin cannot be configured on a consumer (typical for auth plugins)
    { protocols = typedefs.protocols_http },
    { config = {
        -- The 'config' record is the custom part of the plugin schema
        type = "record",
        fields = {
          { request_auth_header = typedefs.header_name {
              required = true,
              default = "Authorization" } },
          
          { upstream_auth_header = typedefs.header_name {
            required = true,
            default = "Authorization" } },

          { response_auth_header = typedefs.header_name {
              required = true,
              default = "Authorization" } },

          { downstream_auth_header = typedefs.header_name {
            required = true,
            default = "Authorization" } },
        },
      },
    },
  },
}

return schema
