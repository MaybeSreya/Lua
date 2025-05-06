local lapis = require("lapis")
local app = lapis.Application()

app:get("/", function()
  return "Hello, World from Lapis!"
end)

return app
