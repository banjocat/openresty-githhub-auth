local auth = {}

function auth.login(ngx)
    local params = "?client_id=" .. os.getenv("client_id") .. "&stage=" .. os.getenv("stage")
    local full_path = os.getenv("github_auth_url") .. params
    ngx.redirect(full_path)
end

return auth

