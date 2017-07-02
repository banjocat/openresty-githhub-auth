local http = require("resty.http")
local json = require("cjson")

local github = {}


function github.login(ngx)
    local params = "?client_id=" .. os.getenv("client_id") .. "&stage=" .. os.getenv("stage")
    local full_path = os.getenv("github_auth_url") .. params
    ngx.redirect(full_path)
end

function github.get_userdata(ngx, access_token)
    local hc = http:new()
    local res, err = hc:request_uri("https://api.github.com/user",
    {
        method = "GET",
        headers = {
            Authorization = "token " .. access_token,
            Accept = "application/json"
        },
        ssl_verify = false, -- Need to eventually do handshake
    })
    if not res then
        ngx.say("failed request: ", err)
        return false
    end

    ngx.print(res.body)
    ngx.send(res.body)
    return res_jsonn
end

function github.get_token(ngx)
    local code = ngx.req.get_uri_args()["code"]
    local hc = http:new()
    local client_param = "client_id=" .. os.getenv("client_id")
    local secret_param = "&client_secret=" .. os.getenv("client_secret")
    local code_param = "&code=" .. code
    local params = client_param .. secret_param .. code_param

    local res, err = hc:request_uri("https://github.com/login/oauth/access_token?" .. params,
    {
        method = "POST",
        headers = {
            Accept = "application/json"
        },
        ssl_verify = false, -- Need to eventually do handshake
    })
    if not res then
        ngx.say("failed request: ", err)
        return false
    end
    local access_token = json.decode(res.body).access_token
    ngx.print(res.body)
    ngx.print(access_token)
    return access_token
end

return github

