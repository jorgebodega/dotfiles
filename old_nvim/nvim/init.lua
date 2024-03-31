require "bootstrap"

local plugins = require "plugins"
require("plugin-loader").install(plugins)

require("config-loader").setup()
