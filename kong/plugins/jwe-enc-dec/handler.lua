-- If you're not sure your plugin is executing, uncomment the line below and restart Kong
-- then it will throw an error which indicates the plugin is being loaded at least.

--assert(ngx.get_phase() == "timer", "The world is coming to an end!")



local JweEncDecHandler = {
  PRIORITY = 1000, -- set the plugin priority, which determines plugin execution order
  VERSION = "0.1", -- version in X.Y.Z format. Check hybrid-mode compatibility requirements.
}

-- do initialization here, any module level code runs in the 'init_by_lua_block',
-- before worker processes are forked. So anything you add here will run once,
-- but be available in all workers.



-- handles more initialization, but AFTER the worker process has been forked/created.
-- It runs in the 'init_worker_by_lua_block'
function JweEncDecHandler:init_worker()

  -- your custom code here
  kong.log.debug("saying hi from the 'init_worker' handler")

end --]]

-- access phase
-- contains dummy logic to decrypt the JWE token
function JweEncDecHandler:access(plugin_conf)

  -- your custom code here
  -- grab the JWE from the header

  local jwe = kong.request.get_header(plugin_conf.request_auth_header)
  -- decrypt it
  local decrypted = "HELLO WORLD"

  -- clear the encryted header
  kong.service.request.clear_header(plugin_conf.request_auth_header)
  -- set the decrypted header sent to upstream
  kong.service.request.set_header(plugin_conf.upstream_auth_header, decrypted)
  
end 

-- runs in the 'header_filter_by_lua_block'
-- contains dummy logic to encrypt the JWE token
function JweEncDecHandler:header_filter(plugin_conf)

  -- your custom code here
  -- grab the plaintext from the header
  
  local plain = kong.response.get_header(plugin_conf.response_auth_header)

  -- encrypt it
  local encrypted = "!@#$%^&*()"

  -- clear the response auth header
  kong.response.clear_header(plugin_conf.response_auth_header)

  -- set the encrypted header sent to downstream
  kong.response.set_header(plugin_conf.downstream_auth_header, encrypted)

end

-- response phase
-- we want to use this in order to buffer the entire response and then encrypt it
-- use if the platintext response is extracted from the body
--[[
function JweEncDecHandler:response(plugin_conf)

  -- your custom code here
  kong.log.inspect(plugin_conf)   -- check the logs for a pretty-printed config!
  kong.service.request.set_header(plugin_conf.request_header, "this is on a request")

end --]]

-- return our plugin object
return JweEncDecHandler
