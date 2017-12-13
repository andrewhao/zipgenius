# Zipgenius Zip Code to Timezone API

Zipgenius is a simple API endpoint that returns timezone data per zip code.

Please open issues in the [zipgenius Github project](https://www.github.com/andrewhao/zipgenius).

All data is courtesy of the [zip2timezone](https://sourceforge.net/projects/zip2timezone/files/) project on Sourceforge.



## Endpoints


  * [Zipgenius.ZipcodeController](#zipgenius-zipcodecontroller)
    * [index](#zipgenius-zipcodecontroller-index)
    * [show](#zipgenius-zipcodecontroller-show)

## Zipgenius.ZipcodeController
### <a id=zipgenius-zipcodecontroller-index></a>index
#### List all zipcodes and associated time zones
##### Request
* __Method:__ GET
* __Path:__ /api/zipcodes
* __Request headers:__
```
accept: application/json
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=31556926
x-request-id: fq82raah1o4jcpvlrefhms9f874o5let
```
* __Response body:__
```json
{
  "zipcodes": [
    {
      "zip": "94606",
      "timezone": "America/Los_Angeles"
    }
  ]
}
```

### <a id=zipgenius-zipcodecontroller-show></a>show
#### Fetch information about specific time zone
##### Request
* __Method:__ GET
* __Path:__ /api/zipcodes/94606
* __Request headers:__
```
accept: application/json
```

##### Response
* __Status__: 200
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=31556926
x-request-id: mnd2c7bmhs6aja72v8e686duvgnlgg82
```
* __Response body:__
```json
{
  "zipcode": {
    "zip": "94606",
    "timezone": "America/Los_Angeles"
  }
}
```

#### Expected response when sending an invalid zip code
##### Request
* __Method:__ GET
* __Path:__ /api/zipcodes/-1
* __Request headers:__
```
accept: application/json
```

##### Response
* __Status__: 404
* __Response headers:__
```
content-type: application/json; charset=utf-8
cache-control: max-age=31556926
x-request-id: u58ike579ua1mr3cu2staubq0sf70am8
```
* __Response body:__
```json
{
  "message": "Unable to find that zip code"
}
```

