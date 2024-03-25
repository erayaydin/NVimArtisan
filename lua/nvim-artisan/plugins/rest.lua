local installed, rest = pcall(require, "rest-nvim")

if not installed then
    return
end

rest.setup({
    skip_ssl_verification = true,
    highlight = {
        enabled = true,
        timeout = 1000,
    },
    result = {
      show_info = {
        url = true,
        headers = true,
        http_info = true,
        curl_command = true,
      },
    },
    env_file = '.env',
})
