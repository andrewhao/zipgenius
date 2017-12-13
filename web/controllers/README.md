# API Documentation

* [Zipgenius.ZipcodeController](#zipgeniuszipcodecontroller)
  * [index](#zipgeniuszipcodecontrollerindex)
  * [show](#zipgeniuszipcodecontrollershow)

## Zipgenius.ZipcodeController
### Zipgenius.ZipcodeController.index
#### GET /api/zipcodes
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
x-request-id: v6u0tm4uoqton8mhlso1jdqqmpsq979v
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

### Zipgenius.ZipcodeController.show
#### GET /api/zipcodes/invalid
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
x-request-id: 16af3lto52btpjgq5k0olpb837t41kst
```
* __Response body:__
```json
{
  "message": "Unable to find that zip code"
}
```

#### GET /api/zipcodes/:zipcode
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
x-request-id: 24b7fda61m8lvteqep55fk3gde9cnbkg
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

