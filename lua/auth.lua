local auth = {}

function auth.login(ngx)
    local github_path = "http://github.com/login/oauth/authorize"
    local params = "?client_id=" .. os.getenv("client_id") .. "&stage=" .. os.getenv("stage")
    local full_path = github_path .. params
    ngx.redirect(full_path)
end

return auth

