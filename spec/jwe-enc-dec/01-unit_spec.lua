local PLUGIN_NAME = "jwe-enc-dec"


-- helper function to validate data against a schema
local validate do
  local validate_entity = require("spec.helpers").validate_plugin_config_schema
  local plugin_schema = require("kong.plugins."..PLUGIN_NAME..".schema")

  function validate(data)
    return validate_entity(data, plugin_schema)
  end
end


describe(PLUGIN_NAME .. ": (schema)", function()


  it("accepts valid inputs", function()
    local ok, err = validate({
        request_auth_header = "Authorization",
        response_auth_header = "Authorization",
        upstream_auth_header = "Authorization",
        downstream_auth_header = "Authorization",
      })
    assert.is_nil(err)
    assert.is_truthy(ok)
  end)


end)
