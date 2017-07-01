local http = require("resty.http")
local json = require("cjson")

local github = {}


function github.login(ngx)
    local params = "?client_id=" .. os.getenv("client_id") .. "&stage=" .. os.getenv("stage")
    local full_path = os.getenv("github_auth_url") .. params
    ngx.redirect(full_path)
end

function github.get_token(ngx)
    local code = ngx.req.get_uri_args()["code"]
    local hc = http:new()
    local data = {
        client_id = os.getenv("client_id"),
        client_secret = os.getenv("client_secret"),
        code = code
    }
    local data_json = json.encode(data)
    local res, err = hc:request_uri("https://github.com/login/oauth/access_token/",
    {
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json"
        },
        body = data_json
    })
    if not rest then
        ngx.say("failed request: ", err)
        return "no"
    end
    ngx.say(res.status)
    return "12"
end

return github

