WORK IN PROGRESS
# Learning excersise for openresty and Oauth2
Thanks for the help
* http://www.staticshin.com/programming/definitely-an-open-resty-guide/
* https://tools.ietf.org/html/draft-ietf-oauth-device-flow-06
* http://tylerneylon.com/a/learn-lua/

### Goals
* Use openresty with lua
* Typical auth endpoints /login, /logout, /auth/github/callback
* / should not be reachable unless logged in
* Try to avoid using redis(might be required)


### .env
export client_id="XXXXX" # Github client id
export stage="randomstring" # session secret.. just use some random string





