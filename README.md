WORK IN PROGRESS
# Learning excersise for openresty and Oauth2
Thanks for the help
* http://www.staticshin.com/programming/definitely-an-open-resty-guide/
* https://tools.ietf.org/html/draft-ietf-oauth-device-flow-06
* http://tylerneylon.com/a/learn-lua/

### What does this solve?
You have application endpoints that may only support basic auth.  
#### Examples
* Flower (Celery monitor)
* Spark worker GUI
* Marathon, Mesos or Aurora GUIs
* Kibana
* Many others

### Goals
* Use openresty with lua
* Make the conf logic it uses extendable (complements docker extension)
* Typical auth endpoints /login, /logout, /auth/github/callback
* / should not be reachable unless logged in
* Session has to stay and not require login on each visit
* Session should delete after an hour of inactivty
* Create docker image and make it easily for others to use
* Encrypt and decrypt clientId
* Authorization via Org and/or username
* Sample login page but should be easy to override
* Try to avoid using redis(might be required) Perhaps allow local and redis storage


### Requirements
* openresty
* luarocks
* `sudo luarocks install lua-resty-http`
* `sudo luarocks install lua-cjson`
* `sudo luarocks install lua-resty-session`

### .env
```
export client_id="XXXXX" # Github client id
export client_secret="XXXXXXXX" # github secret
export stage="randomstring" # session secret.. just use some random string
export github_auth_url="http://github.com/login/oauth/authorize"
```





