local installed, rest = pcall(require, "rest-nvim")

if not installed then
    return
end

rest.setup({
    skip_ssl_verification = true,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
    },
    jump_to_request = true,
    env_file = '.env',
})
