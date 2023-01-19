---
title: API Reference

language_tabs:
- bash
- javascript

includes:

search: true

toc_footers:
- <a href='http://github.com/mpociot/documentarian'>Documentation Powered by Documentarian</a>
---
<!-- START_INFO -->
# Info

Welcome to the generated API reference.
[Get Postman Collection](http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/docs/collection.json)

<!-- END_INFO -->

#Media


APIs for subscription plans
<!-- START_669e5c67665eef979b46aad8e636994f -->
## api/plans
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/plans" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/plans"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/plans`


<!-- END_669e5c67665eef979b46aad8e636994f -->

<!-- START_080c4bceb2251218a8a699f8c1cf23d7 -->
## api/plans/{vendor}/{plan}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/plans/1/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/plans/1/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/plans/{vendor}/{plan}`


<!-- END_080c4bceb2251218a8a699f8c1cf23d7 -->

#Mobile Languages


APIs for mobile languages management
<!-- START_edf545ec080df3f120aa3ac8cc45780a -->
## api/mobilelanguages
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/mobilelanguages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/mobilelanguages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/mobilelanguages`


<!-- END_edf545ec080df3f120aa3ac8cc45780a -->

#Settings


APIs for settings
<!-- START_10633908636252dc838d3a5bd392f07c -->
## api/settings
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "key": "currency_code",
        "value": "USD",
        "type": "string"
    },
    {
        "id": 2,
        "key": "currency_icon",
        "value": "$",
        "type": "string"
    },
    {
        "id": 3,
        "key": "tax_in_percent",
        "value": "10",
        "type": "string"
    },
    {
        "id": 4,
        "key": "support_email",
        "value": "admin@example.com",
        "type": "string"
    },
    {
        "id": 5,
        "key": "support_phone",
        "value": "8181818118",
        "type": "string"
    },
    {
        "id": 6,
        "key": "delivery_fee",
        "value": "25",
        "type": "string"
    },
    {
        "id": 7,
        "key": "delivery_fee_set_by",
        "value": "admin",
        "type": "string"
    },
    {
        "id": 8,
        "key": "delivery_fee_per_km_charge",
        "value": "5",
        "type": "string"
    },
    {
        "id": 9,
        "key": "delivery_distance",
        "value": "8000",
        "type": "string"
    },
    {
        "id": 10,
        "key": "distance_metric",
        "value": "KM",
        "type": "string"
    },
    {
        "id": 11,
        "key": "refer_amount",
        "value": "50",
        "type": "string"
    },
    {
        "id": 12,
        "key": "privacy_policy",
        "value": "Demo privacy policy",
        "type": "string"
    },
    {
        "id": 13,
        "key": "about_us",
        "value": "Demo privacy policy",
        "type": "string"
    },
    {
        "id": 14,
        "key": "terms",
        "value": "Demo Terms and Condition",
        "type": "string"
    },
    {
        "id": 15,
        "key": "admin_commision_value",
        "value": "10",
        "type": "string"
    },
    {
        "id": 16,
        "key": "schedule_interval_in_minutes",
        "value": "30",
        "type": "string"
    }
]
```

### HTTP Request
`GET api/settings`


<!-- END_10633908636252dc838d3a5bd392f07c -->

#Support


APIs for support requests
<!-- START_e5bec0cd80da890ca24d66474358e1cb -->
## Create support request

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/support" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json" \
    -d '{"name":"doloribus","email":"aut","message":"occaecati"}'

```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/support"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "name": "doloribus",
    "email": "aut",
    "message": "occaecati"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[]
```

### HTTP Request
`POST api/support`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `name` | string |  required  | Name
        `email` | string |  required  | Email address
        `message` | string |  required  | Message
    
<!-- END_e5bec0cd80da890ca24d66474358e1cb -->

#User Management


APIs for user management
<!-- START_2b6e5a4b188cb183c7e59558cce36cb6 -->
## api/user
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user`


<!-- END_2b6e5a4b188cb183c7e59558cce36cb6 -->

<!-- START_00f7d0be1226887c1ffa251c97c8740a -->
## api/user
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/user`


<!-- END_00f7d0be1226887c1ffa251c97c8740a -->

<!-- START_0b714276c2e5e68d96c8ede34405fc24 -->
## api/user/notifications
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/notifications" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/notifications"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/notifications`


<!-- END_0b714276c2e5e68d96c8ede34405fc24 -->

<!-- START_5d980d416da79dc09ff29b75e110e9cf -->
## api/user/push-notification
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/push-notification" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/push-notification"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/push-notification`


<!-- END_5d980d416da79dc09ff29b75e110e9cf -->

<!-- START_6cf43c3b8417255ad54be725e20696e9 -->
## api/user/wallet/balance
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/balance" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/balance"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/wallet/balance`


<!-- END_6cf43c3b8417255ad54be725e20696e9 -->

<!-- START_09a076b58cb0a00d42ea64ed5cc29320 -->
## api/user/wallet/deposit
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/deposit" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/deposit"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/wallet/deposit`


<!-- END_09a076b58cb0a00d42ea64ed5cc29320 -->

<!-- START_acd7c544a223b90e3057aa248bf06b27 -->
## api/user/wallet/transactions
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/transactions" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/transactions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/wallet/transactions`


<!-- END_acd7c544a223b90e3057aa248bf06b27 -->

<!-- START_30cebd5eb92f8ada56ac94320d690575 -->
## api/user/wallet/payout
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/payout" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/payout"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/wallet/payout`


<!-- END_30cebd5eb92f8ada56ac94320d690575 -->

<!-- START_41838b2636109f5ce07d14c340a680d0 -->
## api/user/wallet/earnings
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/earnings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/wallet/earnings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/wallet/earnings`


<!-- END_41838b2636109f5ce07d14c340a680d0 -->

<!-- START_c7965b0c93adb069d2064ba0324ca27b -->
## api/user/follow/{user}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/follow/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/follow/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/follow/{user}`


<!-- END_c7965b0c93adb069d2064ba0324ca27b -->

<!-- START_0a7854b71880cd8b3ea00b0f6e7047a3 -->
## api/user/followers/{user}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/followers/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/followers/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/followers/{user}`


<!-- END_0a7854b71880cd8b3ea00b0f6e7047a3 -->

<!-- START_d3ed016f86816edb8bf8d996ffbb8785 -->
## api/user/following/{user}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/following/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/following/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/following/{user}`


<!-- END_d3ed016f86816edb8bf8d996ffbb8785 -->

<!-- START_ba5f96c20dcee41796e4fe015aa41d2e -->
## api/user/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/list`


<!-- END_ba5f96c20dcee41796e4fe015aa41d2e -->

<!-- START_2f4e135fded98494b0167c5f458e291e -->
## api/user/report/{user}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/report/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/report/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/report/{user}`


<!-- END_2f4e135fded98494b0167c5f458e291e -->

<!-- START_2e52a6cdf96f8948df0e30d1a9834911 -->
## api/user/block
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/block" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/block"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/user/block`


<!-- END_2e52a6cdf96f8948df0e30d1a9834911 -->

<!-- START_572463a39f3f6d0edabcddc3752be821 -->
## api/user/block/{user}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/block/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/block/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/block/{user}`


<!-- END_572463a39f3f6d0edabcddc3752be821 -->

<!-- START_ceec0e0b1d13d731ad96603d26bccc2f -->
## api/user/{user}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/user/{user}`


<!-- END_ceec0e0b1d13d731ad96603d26bccc2f -->

<!-- START_9da1ee0e243eb245d246fb1f94c28aea -->
## api/user/follow/stats/{user}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/follow/stats/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/user/follow/stats/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "followers_count": 0,
    "following_count": 0
}
```

### HTTP Request
`GET api/user/follow/stats/{user}`


<!-- END_9da1ee0e243eb245d246fb1f94c28aea -->

#general


<!-- START_c6c5c00d6ac7f771f157dff4a2889b1a -->
## _debugbar/open
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/open" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/open"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": ""
}
```

### HTTP Request
`GET _debugbar/open`


<!-- END_c6c5c00d6ac7f771f157dff4a2889b1a -->

<!-- START_7b167949c615f4a7e7b673f8d5fdaf59 -->
## Return Clockwork output

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/clockwork/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/clockwork/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": ""
}
```

### HTTP Request
`GET _debugbar/clockwork/{id}`


<!-- END_7b167949c615f4a7e7b673f8d5fdaf59 -->

<!-- START_01a252c50bd17b20340dbc5a91cea4b7 -->
## _debugbar/telescope/{id}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/telescope/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/telescope/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": ""
}
```

### HTTP Request
`GET _debugbar/telescope/{id}`


<!-- END_01a252c50bd17b20340dbc5a91cea4b7 -->

<!-- START_5f8a640000f5db43332951f0d77378c4 -->
## Return the stylesheets for the Debugbar

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/assets/stylesheets" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/assets/stylesheets"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": ""
}
```

### HTTP Request
`GET _debugbar/assets/stylesheets`


<!-- END_5f8a640000f5db43332951f0d77378c4 -->

<!-- START_db7a887cf930ce3c638a8708fd1a75ee -->
## Return the javascript for the Debugbar

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/assets/javascript" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/assets/javascript"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": ""
}
```

### HTTP Request
`GET _debugbar/assets/javascript`


<!-- END_db7a887cf930ce3c638a8708fd1a75ee -->

<!-- START_0973671c4f56e7409202dc85c868d442 -->
## Forget a cache key

> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/cache/1/" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/_debugbar/cache/1/"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE _debugbar/cache/{key}/{tags?}`


<!-- END_0973671c4f56e7409202dc85c868d442 -->

<!-- START_1e95bccec526c2f1452c6285ac58bd7b -->
## Shows the overview, where you can visually edit your .env-file.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET admin/env`


<!-- END_1e95bccec526c2f1452c6285ac58bd7b -->

<!-- START_5fac508854296dfd68d3e51e7600a655 -->
## Adds a new entry to your .env-file.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/add" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/add"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/env/add`


<!-- END_5fac508854296dfd68d3e51e7600a655 -->

<!-- START_33454ffa47815c13dae9d002bc598b1f -->
## Updates the given entry from your .env.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/update" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/update"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/env/update`


<!-- END_33454ffa47815c13dae9d002bc598b1f -->

<!-- START_d010e1c50bbfa1ce91c53d2484f6f754 -->
## Creates a backup of the current .env.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/createbackup" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/createbackup"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET admin/env/createbackup`


<!-- END_d010e1c50bbfa1ce91c53d2484f6f754 -->

<!-- START_7b9615789d33ea33972f52d243d2f5a4 -->
## Delete Backup

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/deletebackup/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/deletebackup/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET admin/env/deletebackup/{timestamp}`


<!-- END_7b9615789d33ea33972f52d243d2f5a4 -->

<!-- START_c1029d54d27a57750f59677afb689c7b -->
## Restore a backup

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/restore/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/restore/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET admin/env/restore/{backuptimestamp}`


<!-- END_c1029d54d27a57750f59677afb689c7b -->

<!-- START_7d7e96a22ff62dbfdc3ba21562d211bb -->
## Deletes the given entry from your .env-file

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/delete" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/delete"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/env/delete`


<!-- END_7d7e96a22ff62dbfdc3ba21562d211bb -->

<!-- START_cb7111f4d5d879ba35c0cd7f7d5fe8f2 -->
## Lets you download the choosen backup-file.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/download/" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/download/"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET admin/env/download/{filename?}`


<!-- END_cb7111f4d5d879ba35c0cd7f7d5fe8f2 -->

<!-- START_5e60f6836b9afeddc1218d2bad9668f2 -->
## Upload a .env-file and replace the current one

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/upload" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/upload"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST admin/env/upload`


<!-- END_5e60f6836b9afeddc1218d2bad9668f2 -->

<!-- START_39f535582a89a293a68d4f3dd29b53a7 -->
## Returns the content as JSON

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/getdetails/" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/admin/env/getdetails/"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET admin/env/getdetails/{timestamp?}`


<!-- END_39f535582a89a293a68d4f3dd29b53a7 -->

<!-- START_403a8192e36a269247d3863add04d8df -->
## api/artisan/command
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/artisan/command" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/artisan/command"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/artisan/command`


<!-- END_403a8192e36a269247d3863add04d8df -->

<!-- START_1342712ccbf02c9364b98eb3b9ac9427 -->
## api/admin/banners
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/banners`


<!-- END_1342712ccbf02c9364b98eb3b9ac9427 -->

<!-- START_f4d56415956d1672ee0b80588d51dd03 -->
## api/admin/banners
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/banners`


<!-- END_f4d56415956d1672ee0b80588d51dd03 -->

<!-- START_3f67679b3526538f8d1b3519219db83d -->
## api/admin/banners/{banner}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/banners/{banner}`


<!-- END_3f67679b3526538f8d1b3519219db83d -->

<!-- START_804ab8ca32b67c0a7baa7e117b860bad -->
## api/admin/banners/{banner}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/banners/{banner}`

`PATCH api/admin/banners/{banner}`


<!-- END_804ab8ca32b67c0a7baa7e117b860bad -->

<!-- START_89cd51d31cce00df53363dbd01468dac -->
## api/admin/banners/{banner}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/banners/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/banners/{banner}`


<!-- END_89cd51d31cce00df53363dbd01468dac -->

<!-- START_400fb4764df1b01a1c10c5790a4e4f40 -->
## api/banners
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/banners" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/banners"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "data": [
        {
            "id": 1,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "title_translations": {
                "en": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            "meta": {
                "scope": "ecommerce"
            },
            "sort_order": 1,
            "mediaurls": {
                "images": [
                    {
                        "default": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/3\/200.png",
                        "thumb": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/3\/conversions\/200-thumb.jpg"
                    }
                ]
            }
        },
        {
            "id": 3,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "title_translations": {
                "en": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            "meta": {
                "scope": "doctor"
            },
            "sort_order": 1,
            "mediaurls": {
                "images": [
                    {
                        "default": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/5\/200.png",
                        "thumb": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/5\/conversions\/200-thumb.jpg"
                    }
                ]
            }
        },
        {
            "id": 5,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "title_translations": {
                "en": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            "meta": {
                "scope": "hospital"
            },
            "sort_order": 1,
            "mediaurls": {
                "images": [
                    {
                        "default": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/7\/200.png",
                        "thumb": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/7\/conversions\/200-thumb.jpg"
                    }
                ]
            }
        },
        {
            "id": 2,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "title_translations": {
                "en": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            "meta": {
                "scope": "ecommerce"
            },
            "sort_order": 2,
            "mediaurls": {
                "images": [
                    {
                        "default": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/4\/200.png",
                        "thumb": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/4\/conversions\/200-thumb.jpg"
                    }
                ]
            }
        },
        {
            "id": 4,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "title_translations": {
                "en": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            "meta": {
                "scope": "doctor"
            },
            "sort_order": 2,
            "mediaurls": {
                "images": [
                    {
                        "default": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/6\/200.png",
                        "thumb": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/6\/conversions\/200-thumb.jpg"
                    }
                ]
            }
        },
        {
            "id": 6,
            "title": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "title_translations": {
                "en": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            "meta": {
                "scope": "hospital"
            },
            "sort_order": 2,
            "mediaurls": {
                "images": [
                    {
                        "default": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/8\/200.png",
                        "thumb": "http:\/\/doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com\/doctoworld\/public\/storage\/8\/conversions\/200-thumb.jpg"
                    }
                ]
            }
        }
    ],
    "links": {
        "first": "http:\/\/localhost\/api\/banners?page=1",
        "last": "http:\/\/localhost\/api\/banners?page=1",
        "prev": null,
        "next": null
    },
    "meta": {
        "current_page": 1,
        "from": 1,
        "last_page": 1,
        "path": "http:\/\/localhost\/api\/banners",
        "per_page": 15,
        "to": 6,
        "total": 6
    }
}
```

### HTTP Request
`GET api/banners`


<!-- END_400fb4764df1b01a1c10c5790a4e4f40 -->

<!-- START_50ccc753056204beb6cf1fb6ee5d60ba -->
## api/admin/categories/download-template-file
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/download-template-file" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/download-template-file"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/admin/categories/download-template-file`


<!-- END_50ccc753056204beb6cf1fb6ee5d60ba -->

<!-- START_0b4853f3dc71b0fb5c98748412eedd3c -->
## api/admin/categories/import-file
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/import-file" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/import-file"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/categories/import-file`


<!-- END_0b4853f3dc71b0fb5c98748412eedd3c -->

<!-- START_aba6e7326a8a1d276c1adacebe2a4093 -->
## api/admin/categories
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/categories`


<!-- END_aba6e7326a8a1d276c1adacebe2a4093 -->

<!-- START_78aa259c26474d0eb3255c793999154d -->
## api/admin/categories
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/categories`


<!-- END_78aa259c26474d0eb3255c793999154d -->

<!-- START_d3970d657b32f9b199272b75c7611004 -->
## api/admin/categories/{category}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/categories/{category}`


<!-- END_d3970d657b32f9b199272b75c7611004 -->

<!-- START_a26d7aedf5f50ea6cb58eae461bf25fd -->
## api/admin/categories/{category}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/categories/{category}`

`PATCH api/admin/categories/{category}`


<!-- END_a26d7aedf5f50ea6cb58eae461bf25fd -->

<!-- START_d130f95fc7fa9e659f357636f0da19b1 -->
## api/admin/categories/{category}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/categories/{category}`


<!-- END_d130f95fc7fa9e659f357636f0da19b1 -->

<!-- START_0c068b4037fb2e47e71bd44bd36e3e2a -->
## Authorize a client to access the user&#039;s account.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/authorize" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/authorize"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET oauth/authorize`


<!-- END_0c068b4037fb2e47e71bd44bd36e3e2a -->

<!-- START_e48cc6a0b45dd21b7076ab2c03908687 -->
## Approve the authorization request.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/authorize" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/authorize"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/authorize`


<!-- END_e48cc6a0b45dd21b7076ab2c03908687 -->

<!-- START_de5d7581ef1275fce2a229b6b6eaad9c -->
## Deny the authorization request.

> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/authorize" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/authorize"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/authorize`


<!-- END_de5d7581ef1275fce2a229b6b6eaad9c -->

<!-- START_a09d20357336aa979ecd8e3972ac9168 -->
## Authorize a client to access the user&#039;s account.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/token" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/token"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/token`


<!-- END_a09d20357336aa979ecd8e3972ac9168 -->

<!-- START_d6a56149547e03307199e39e03e12d1c -->
## Get all of the authorized tokens for the authenticated user.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/tokens" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/tokens"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET oauth/tokens`


<!-- END_d6a56149547e03307199e39e03e12d1c -->

<!-- START_a9a802c25737cca5324125e5f60b72a5 -->
## Delete the given token.

> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/tokens/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/tokens/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/tokens/{token_id}`


<!-- END_a9a802c25737cca5324125e5f60b72a5 -->

<!-- START_abe905e69f5d002aa7d26f433676d623 -->
## Get a fresh transient token cookie for the authenticated user.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/token/refresh" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/token/refresh"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/token/refresh`


<!-- END_abe905e69f5d002aa7d26f433676d623 -->

<!-- START_babcfe12d87b8708f5985e9d39ba8f2c -->
## Get all of the clients for the authenticated user.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET oauth/clients`


<!-- END_babcfe12d87b8708f5985e9d39ba8f2c -->

<!-- START_9eabf8d6e4ab449c24c503fcb42fba82 -->
## Store a new client.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/clients`


<!-- END_9eabf8d6e4ab449c24c503fcb42fba82 -->

<!-- START_784aec390a455073fc7464335c1defa1 -->
## Update the given client.

> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT oauth/clients/{client_id}`


<!-- END_784aec390a455073fc7464335c1defa1 -->

<!-- START_1f65a511dd86ba0541d7ba13ca57e364 -->
## Delete the given client.

> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/clients/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/clients/{client_id}`


<!-- END_1f65a511dd86ba0541d7ba13ca57e364 -->

<!-- START_9e281bd3a1eb1d9eb63190c8effb607c -->
## Get all of the available scopes for the application.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/scopes" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/scopes"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET oauth/scopes`


<!-- END_9e281bd3a1eb1d9eb63190c8effb607c -->

<!-- START_9b2a7699ce6214a79e0fd8107f8b1c9e -->
## Get all of the personal access tokens for the authenticated user.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/personal-access-tokens" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/personal-access-tokens"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET oauth/personal-access-tokens`


<!-- END_9b2a7699ce6214a79e0fd8107f8b1c9e -->

<!-- START_a8dd9c0a5583742e671711f9bb3ee406 -->
## Create a new personal access token for the user.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/personal-access-tokens" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/personal-access-tokens"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST oauth/personal-access-tokens`


<!-- END_a8dd9c0a5583742e671711f9bb3ee406 -->

<!-- START_bae65df80fd9d72a01439241a9ea20d0 -->
## Delete the given token.

> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/personal-access-tokens/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/oauth/personal-access-tokens/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE oauth/personal-access-tokens/{token_id}`


<!-- END_bae65df80fd9d72a01439241a9ea20d0 -->

<!-- START_e9aa8e9cecac4d07efa45f1b2d470efb -->
## Login admin user

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/login" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/login"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/login`


<!-- END_e9aa8e9cecac4d07efa45f1b2d470efb -->

<!-- START_5a2c8f043b0e8c6e71438182e59b2d82 -->
## api/admin/config/languages
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/config/languages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/config/languages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    "es"
]
```

### HTTP Request
`GET api/admin/config/languages`


<!-- END_5a2c8f043b0e8c6e71438182e59b2d82 -->

<!-- START_06a627a5eb543d30a45a91c1df3f4d46 -->
## api/admin/users/roles
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/roles" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/roles"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/users/roles`


<!-- END_06a627a5eb543d30a45a91c1df3f4d46 -->

<!-- START_0beace9153e54256b7e0783bfaf1d4f5 -->
## api/admin/users/reports
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/reports" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/reports"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/users/reports`


<!-- END_0beace9153e54256b7e0783bfaf1d4f5 -->

<!-- START_72e6bac7f5fcb40f81e08f232ec633ec -->
## api/admin/users/reports/{report}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/reports/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/reports/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/users/reports/{report}`


<!-- END_72e6bac7f5fcb40f81e08f232ec633ec -->

<!-- START_1fdf5c126c9b5b722e5044c3f680bf8e -->
## api/admin/users
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/users`


<!-- END_1fdf5c126c9b5b722e5044c3f680bf8e -->

<!-- START_dc2d86108b3ba680c4c4c02f4f766df8 -->
## api/admin/users
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/users`


<!-- END_dc2d86108b3ba680c4c4c02f4f766df8 -->

<!-- START_538c6352521b306dbf554e89cd64ac98 -->
## api/admin/users/{user}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/users/{user}`


<!-- END_538c6352521b306dbf554e89cd64ac98 -->

<!-- START_a7a0cf16fbe0b43360d4ccee6a11c638 -->
## api/admin/users/{user}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/users/{user}`

`PATCH api/admin/users/{user}`


<!-- END_a7a0cf16fbe0b43360d4ccee6a11c638 -->

<!-- START_7d625b15e5b59cfac2c9129fa450c5f5 -->
## api/admin/users/{user}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/users/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/users/{user}`


<!-- END_7d625b15e5b59cfac2c9129fa450c5f5 -->

<!-- START_75e45b80aeaa348942f9f70b3c576cc6 -->
## api/admin/mobilelanguages
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/mobilelanguages`


<!-- END_75e45b80aeaa348942f9f70b3c576cc6 -->

<!-- START_6642d25ba93bdeae5d33aa4160d9b8a9 -->
## api/admin/mobilelanguages
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/mobilelanguages`


<!-- END_6642d25ba93bdeae5d33aa4160d9b8a9 -->

<!-- START_e024b4d5b935b1d207b315b1eca0f6dd -->
## api/admin/mobilelanguages/{mobilelanguage}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/mobilelanguages/{mobilelanguage}`


<!-- END_e024b4d5b935b1d207b315b1eca0f6dd -->

<!-- START_ebe0ad7bf3e6ab48dcaa5bee22199308 -->
## api/admin/mobilelanguages/{mobilelanguage}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/mobilelanguages/{mobilelanguage}`

`PATCH api/admin/mobilelanguages/{mobilelanguage}`


<!-- END_ebe0ad7bf3e6ab48dcaa5bee22199308 -->

<!-- START_f13eaf876bd1afe8ee1a3534ee2b5f0e -->
## api/admin/mobilelanguages/{mobilelanguage}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/mobilelanguages/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/mobilelanguages/{mobilelanguage}`


<!-- END_f13eaf876bd1afe8ee1a3534ee2b5f0e -->

<!-- START_27ace2d632e7b04df6b9c5236b5d5b11 -->
## api/admin/wallet/transactions
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/wallet/transactions" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/wallet/transactions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/wallet/transactions`


<!-- END_27ace2d632e7b04df6b9c5236b5d5b11 -->

<!-- START_bfe29f46085159418b8f7251b8bb0a8c -->
## api/admin/wallet/transactions/{transaction}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/wallet/transactions/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/wallet/transactions/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/wallet/transactions/{transaction}`


<!-- END_bfe29f46085159418b8f7251b8bb0a8c -->

<!-- START_2f6661c86b479b7d2a877b69fd562dd4 -->
## api/admin/wallet/transactions/{transaction}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/wallet/transactions/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/wallet/transactions/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/wallet/transactions/{transaction}`


<!-- END_2f6661c86b479b7d2a877b69fd562dd4 -->

<!-- START_02405f27245a96c303f8ac423c5225a4 -->
## api/admin/settings
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/settings`


<!-- END_02405f27245a96c303f8ac423c5225a4 -->

<!-- START_b0eb233385cf807da01ff25ac855512a -->
## api/admin/settings
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/settings`


<!-- END_b0eb233385cf807da01ff25ac855512a -->

<!-- START_e1270ceb1d8ab16344b52a741bbd47dc -->
## api/admin/settings/env
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings/env" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings/env"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/settings/env`


<!-- END_e1270ceb1d8ab16344b52a741bbd47dc -->

<!-- START_6a67272bfc83536092f542bf3a89fb4b -->
## Update env variables.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings/env" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/settings/env"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/settings/env`


<!-- END_6a67272bfc83536092f542bf3a89fb4b -->

<!-- START_bca5aad8ac268b883ce9a17285455241 -->
## api/admin/dashboard/user-analytics
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/user-analytics" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/user-analytics"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/dashboard/user-analytics`


<!-- END_bca5aad8ac268b883ce9a17285455241 -->

<!-- START_64df096d6e1e97c68c70d40058d64a58 -->
## api/admin/dashboard/transaction-analytics
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/transaction-analytics" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/transaction-analytics"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/dashboard/transaction-analytics`


<!-- END_64df096d6e1e97c68c70d40058d64a58 -->

<!-- START_89e1a425952b6b69bb425540f23fc8c7 -->
## api/admin/dashboard/activity-analytics
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/activity-analytics" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/activity-analytics"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/dashboard/activity-analytics`


<!-- END_89e1a425952b6b69bb425540f23fc8c7 -->

<!-- START_26fab104cb03bb4f357f6cad11a5494a -->
## api/admin/plans
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/plans`


<!-- END_26fab104cb03bb4f357f6cad11a5494a -->

<!-- START_72f748007289d4e6f032a4854ff7920d -->
## api/admin/plans
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/plans`


<!-- END_72f748007289d4e6f032a4854ff7920d -->

<!-- START_aa286e58fe17836a11d20a5a6ca8f248 -->
## api/admin/plans/{plan}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/plans/{plan}`


<!-- END_aa286e58fe17836a11d20a5a6ca8f248 -->

<!-- START_d9675d20c2a8f8f71d33c324331885d0 -->
## api/admin/plans/{plan}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/plans/{plan}`

`PATCH api/admin/plans/{plan}`


<!-- END_d9675d20c2a8f8f71d33c324331885d0 -->

<!-- START_852c9f91cd8b84dc0dbf44173ce441d3 -->
## api/admin/plans/{plan}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/plans/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/plans/{plan}`


<!-- END_852c9f91cd8b84dc0dbf44173ce441d3 -->

<!-- START_4c4b7fa609ef4dccfcb3e2fababd1dfe -->
## api/admin/doctor/hospitals
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/doctor/hospitals`


<!-- END_4c4b7fa609ef4dccfcb3e2fababd1dfe -->

<!-- START_024116f5384be47316d403efdf250500 -->
## api/admin/doctor/hospitals
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/doctor/hospitals`


<!-- END_024116f5384be47316d403efdf250500 -->

<!-- START_f8c1706ec904858de8c168ee151a592e -->
## api/admin/doctor/hospitals/{hospital}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/doctor/hospitals/{hospital}`


<!-- END_f8c1706ec904858de8c168ee151a592e -->

<!-- START_2828cc73cd20e50e80f519fc7477982b -->
## api/admin/doctor/hospitals/{hospital}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/doctor/hospitals/{hospital}`

`PATCH api/admin/doctor/hospitals/{hospital}`


<!-- END_2828cc73cd20e50e80f519fc7477982b -->

<!-- START_ab1eb924640a29ae486e742ef73e4b3b -->
## api/admin/doctor/hospitals/{hospital}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/hospitals/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/doctor/hospitals/{hospital}`


<!-- END_ab1eb924640a29ae486e742ef73e4b3b -->

<!-- START_333c4c722f894c3b83edca73a9b40479 -->
## api/admin/doctor/doctorprofiles
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/doctor/doctorprofiles`


<!-- END_333c4c722f894c3b83edca73a9b40479 -->

<!-- START_abddf2a69205e865b7877de0a2be1dee -->
## api/admin/doctor/doctorprofiles
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/doctor/doctorprofiles`


<!-- END_abddf2a69205e865b7877de0a2be1dee -->

<!-- START_0ae4a2ec55dc1326aa7a4034c18e5c70 -->
## api/admin/doctor/doctorprofiles/{doctorprofile}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/doctor/doctorprofiles/{doctorprofile}`


<!-- END_0ae4a2ec55dc1326aa7a4034c18e5c70 -->

<!-- START_0b752699dc2f18aab7fef52aba09144b -->
## api/admin/doctor/doctorprofiles/{doctorprofile}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/doctor/doctorprofiles/{doctorprofile}`

`PATCH api/admin/doctor/doctorprofiles/{doctorprofile}`


<!-- END_0b752699dc2f18aab7fef52aba09144b -->

<!-- START_5cfccd2457c2a9db90b540fa5fac14ad -->
## api/admin/doctor/doctorprofiles/{doctorprofile}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/doctorprofiles/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/doctor/doctorprofiles/{doctorprofile}`


<!-- END_5cfccd2457c2a9db90b540fa5fac14ad -->

<!-- START_e2442bca967f2ab11a8230869871e18a -->
## api/admin/doctor/appointments
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/doctor/appointments`


<!-- END_e2442bca967f2ab11a8230869871e18a -->

<!-- START_3332a25a0ef0dd5e3b5d29230202019d -->
## api/admin/doctor/appointments/{appointment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/doctor/appointments/{appointment}`


<!-- END_3332a25a0ef0dd5e3b5d29230202019d -->

<!-- START_a0139d7be9791288c208e41858235a6d -->
## api/admin/doctor/appointments/{appointment}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/doctor/appointments/{appointment}`

`PATCH api/admin/doctor/appointments/{appointment}`


<!-- END_a0139d7be9791288c208e41858235a6d -->

<!-- START_cca87c8660188bcfe2cc273618f7ee26 -->
## api/admin/doctor/appointments/{appointment}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/doctor/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/doctor/appointments/{appointment}`


<!-- END_cca87c8660188bcfe2cc273618f7ee26 -->

<!-- START_1d1468c1e4738fbf4e3925d598c3d32c -->
## api/doctor/hospitals
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/doctor/hospitals`


<!-- END_1d1468c1e4738fbf4e3925d598c3d32c -->

<!-- START_0ccf784ac0f7d61acce36537c9c827a8 -->
## api/doctor/profile/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "data": [],
    "links": {
        "first": "http:\/\/localhost\/api\/doctor\/profile\/list?page=1",
        "last": "http:\/\/localhost\/api\/doctor\/profile\/list?page=1",
        "prev": null,
        "next": null
    },
    "meta": {
        "current_page": 1,
        "from": null,
        "last_page": 1,
        "path": "http:\/\/localhost\/api\/doctor\/profile\/list",
        "per_page": 15,
        "to": null,
        "total": 0
    }
}
```

### HTTP Request
`GET api/doctor/profile/list`


<!-- END_0ccf784ac0f7d61acce36537c9c827a8 -->

<!-- START_41e653f7f85d28723d8db3290a932575 -->
## api/doctor/profile/{profile}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": "No query results for model [Vtlabs\\Doctor\\Models\\DoctorProfile] 1"
}
```

### HTTP Request
`GET api/doctor/profile/{profile}`


<!-- END_41e653f7f85d28723d8db3290a932575 -->

<!-- START_2e494634e42d124ef2df8afa365ffecd -->
## api/doctor/profile/schedule/{doctor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/schedule/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/schedule/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (404):

```json
{
    "message": "No query results for model [Vtlabs\\Doctor\\Models\\DoctorProfile] 1"
}
```

### HTTP Request
`GET api/doctor/profile/schedule/{doctor}`


<!-- END_2e494634e42d124ef2df8afa365ffecd -->

<!-- START_115aa07c6f23f300d7b4290dfd35b288 -->
## api/doctor/profile
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/profile`


<!-- END_115aa07c6f23f300d7b4290dfd35b288 -->

<!-- START_a57e652392a0819a35b8ec8500a3259d -->
## api/doctor/profile
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/doctor/profile`


<!-- END_a57e652392a0819a35b8ec8500a3259d -->

<!-- START_06733d25fdda38416bf50dccee74ad0b -->
## api/doctor/profile/ratings/{doctor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/profile/ratings/{doctor}`


<!-- END_06733d25fdda38416bf50dccee74ad0b -->

<!-- START_18c7687b8cc48d5a7c265c982b2e6a39 -->
## api/doctor/profile/ratings/{doctor}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/doctor/profile/ratings/{doctor}`


<!-- END_18c7687b8cc48d5a7c265c982b2e6a39 -->

<!-- START_6e76788fab5d4d79e48afdce6cea596d -->
## api/doctor/profile/ratings/summary/{doctor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/ratings/summary/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/ratings/summary/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/profile/ratings/summary/{doctor}`


<!-- END_6e76788fab5d4d79e48afdce6cea596d -->

<!-- START_a71f22c0c9981043247ac4995c43d7dd -->
## api/doctor/profile/favourites/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/favourites/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/favourites/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/profile/favourites/list`


<!-- END_a71f22c0c9981043247ac4995c43d7dd -->

<!-- START_927994db42f6a6fec126aa2d65f013e2 -->
## api/doctor/profile/favourites/{doctor}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/favourites/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/profile/favourites/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/doctor/profile/favourites/{doctor}`


<!-- END_927994db42f6a6fec126aa2d65f013e2 -->

<!-- START_b5f50dd74696a8ef7a81b165390b74b9 -->
## api/doctor/hospitals/ratings/{hospital}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/hospitals/ratings/{hospital}`


<!-- END_b5f50dd74696a8ef7a81b165390b74b9 -->

<!-- START_b2ffa0375a9fb2795c850ed240442810 -->
## api/doctor/hospitals/ratings/{hospital}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/doctor/hospitals/ratings/{hospital}`


<!-- END_b2ffa0375a9fb2795c850ed240442810 -->

<!-- START_0f1838397a9653dbdb7f3d2b372c42fe -->
## api/doctor/hospitals/ratings/summary/{hospital}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/ratings/summary/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/ratings/summary/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/hospitals/ratings/summary/{hospital}`


<!-- END_0f1838397a9653dbdb7f3d2b372c42fe -->

<!-- START_7d5f1c519b00d5d1815d0f226dd666b5 -->
## api/doctor/hospitals/favourites/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/favourites/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/favourites/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/hospitals/favourites/list`


<!-- END_7d5f1c519b00d5d1815d0f226dd666b5 -->

<!-- START_11b8c6f5c58d0ac677707a2f0bd2d1f4 -->
## api/doctor/hospitals/favourites/{hospital}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/favourites/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/hospitals/favourites/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/doctor/hospitals/favourites/{hospital}`


<!-- END_11b8c6f5c58d0ac677707a2f0bd2d1f4 -->

<!-- START_2863e9955191b5ccc4508fdf71a4c501 -->
## api/doctor/appointments
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/appointments" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/appointments"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/doctor/appointments`


<!-- END_2863e9955191b5ccc4508fdf71a4c501 -->

<!-- START_5c32a556e49a9402d7451eb5d8844aa8 -->
## api/doctor/appointments/{doctorProfile}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/doctor/appointments/{doctorProfile}`


<!-- END_5c32a556e49a9402d7451eb5d8844aa8 -->

<!-- START_20c8c7f65a7a66034c143d03df8e4b38 -->
## api/doctor/appointments/{appointment}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/doctor/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/doctor/appointments/{appointment}`


<!-- END_20c8c7f65a7a66034c143d03df8e4b38 -->

<!-- START_8be353e1525b19555cb2f88f7a124678 -->
## api/admin/products/download-template-file
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/download-template-file" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/download-template-file"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`GET api/admin/products/download-template-file`


<!-- END_8be353e1525b19555cb2f88f7a124678 -->

<!-- START_c2d165d8a012bed829761019a781dd3f -->
## api/admin/products/import-file
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/import-file" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/import-file"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/products/import-file`


<!-- END_c2d165d8a012bed829761019a781dd3f -->

<!-- START_00a2cb5a6b95704acda8c3b936f9007b -->
## api/admin/vendors
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/vendors`


<!-- END_00a2cb5a6b95704acda8c3b936f9007b -->

<!-- START_1ee7a59ff1996ec303bf763b02d5fcd4 -->
## api/admin/vendors
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/vendors`


<!-- END_1ee7a59ff1996ec303bf763b02d5fcd4 -->

<!-- START_3eccfb4b3eef38c16c6c485b54d0d084 -->
## api/admin/vendors/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/vendors/{vendor}`


<!-- END_3eccfb4b3eef38c16c6c485b54d0d084 -->

<!-- START_a86ecb5ea7e0a787a4efaa316743d3e2 -->
## api/admin/vendors/{vendor}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/vendors/{vendor}`

`PATCH api/admin/vendors/{vendor}`


<!-- END_a86ecb5ea7e0a787a4efaa316743d3e2 -->

<!-- START_43c8d6ed226182ca9c7e1bb98492f347 -->
## api/admin/vendors/{vendor}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/vendors/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/vendors/{vendor}`


<!-- END_43c8d6ed226182ca9c7e1bb98492f347 -->

<!-- START_85bd9da640ee7e09ba5d4ef8b434628b -->
## api/admin/products
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/products`


<!-- END_85bd9da640ee7e09ba5d4ef8b434628b -->

<!-- START_bc41c5abcf8a679b8a059c689ea8ac0c -->
## api/admin/products
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/products`


<!-- END_bc41c5abcf8a679b8a059c689ea8ac0c -->

<!-- START_9332e51c1fdec8d85b3840fcb9237a92 -->
## api/admin/products/{product}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/products/{product}`


<!-- END_9332e51c1fdec8d85b3840fcb9237a92 -->

<!-- START_15064cc3389a4b7af179b4a8951e7af4 -->
## api/admin/products/{product}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/products/{product}`

`PATCH api/admin/products/{product}`


<!-- END_15064cc3389a4b7af179b4a8951e7af4 -->

<!-- START_b691df95f44afd2bb49d599df958f848 -->
## api/admin/products/{product}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/products/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/products/{product}`


<!-- END_b691df95f44afd2bb49d599df958f848 -->

<!-- START_40f5a4504d42fc88caef48a9b453e0aa -->
## api/admin/orders
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/orders`


<!-- END_40f5a4504d42fc88caef48a9b453e0aa -->

<!-- START_876f4dae88a2290b943b543b6610e96a -->
## api/admin/orders/{order}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "error": "exception.unauthenticated"
}
```

### HTTP Request
`GET api/admin/orders/{order}`


<!-- END_876f4dae88a2290b943b543b6610e96a -->

<!-- START_253c8b6633c245845b87973c497fb616 -->
## api/admin/orders/{order}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/orders/{order}`

`PATCH api/admin/orders/{order}`


<!-- END_253c8b6633c245845b87973c497fb616 -->

<!-- START_5c295f6a3c3a53ee99d6a72457b8024f -->
## api/admin/orders/{order}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/orders/{order}`


<!-- END_5c295f6a3c3a53ee99d6a72457b8024f -->

<!-- START_75902b9185fff2f371107c2b8761c522 -->
## api/admin/coupons
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/coupons`


<!-- END_75902b9185fff2f371107c2b8761c522 -->

<!-- START_a7e4cffff76344fc1ade6915598178b0 -->
## api/admin/coupons
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/coupons`


<!-- END_a7e4cffff76344fc1ade6915598178b0 -->

<!-- START_8e09b214f4766987e8dcea66233961fc -->
## api/admin/coupons/{coupon}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/coupons/{coupon}`


<!-- END_8e09b214f4766987e8dcea66233961fc -->

<!-- START_dac1a7ce7ed51911973f31b35539a23f -->
## api/admin/coupons/{coupon}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/coupons/{coupon}`

`PATCH api/admin/coupons/{coupon}`


<!-- END_dac1a7ce7ed51911973f31b35539a23f -->

<!-- START_032b0a0ae6e34f008748beca0091b4c5 -->
## api/admin/coupons/{coupon}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/coupons/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/coupons/{coupon}`


<!-- END_032b0a0ae6e34f008748beca0091b4c5 -->

<!-- START_9ce9559567c78e9767b07290b93df8ed -->
## api/admin/deliverymodes
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/deliverymodes`


<!-- END_9ce9559567c78e9767b07290b93df8ed -->

<!-- START_ed80022ce343cd8b9d9eddbb78a16ccb -->
## api/admin/deliverymodes
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/deliverymodes`


<!-- END_ed80022ce343cd8b9d9eddbb78a16ccb -->

<!-- START_71b0e7c9306e5edc2e93704f3977a2e2 -->
## api/admin/deliverymodes/{deliverymode}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/deliverymodes/{deliverymode}`


<!-- END_71b0e7c9306e5edc2e93704f3977a2e2 -->

<!-- START_c316c8bda7ca2da56055ecc1f12aeed6 -->
## api/admin/deliverymodes/{deliverymode}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/deliverymodes/{deliverymode}`

`PATCH api/admin/deliverymodes/{deliverymode}`


<!-- END_c316c8bda7ca2da56055ecc1f12aeed6 -->

<!-- START_90853565eacec6f67f94d32cc230d752 -->
## api/admin/deliverymodes/{deliverymode}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliverymodes/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/deliverymodes/{deliverymode}`


<!-- END_90853565eacec6f67f94d32cc230d752 -->

<!-- START_b76a281bb125dd46e0527ec5ffb01c49 -->
## api/admin/deliveries
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/deliveries`


<!-- END_b76a281bb125dd46e0527ec5ffb01c49 -->

<!-- START_75a7c9afa9397c1e86f6346d3bb92ce8 -->
## api/admin/deliveries
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/deliveries`


<!-- END_75a7c9afa9397c1e86f6346d3bb92ce8 -->

<!-- START_581fb7c8dab0bc636cde55d484b55c83 -->
## api/admin/deliveries/{delivery}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/deliveries/{delivery}`


<!-- END_581fb7c8dab0bc636cde55d484b55c83 -->

<!-- START_51d83723c7f3eaf41476180237ba565c -->
## api/admin/deliveries/{delivery}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/deliveries/{delivery}`

`PATCH api/admin/deliveries/{delivery}`


<!-- END_51d83723c7f3eaf41476180237ba565c -->

<!-- START_d9a54e8a69f5e98ed85042afad984141 -->
## api/admin/deliveries/{delivery}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/deliveries/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/deliveries/{delivery}`


<!-- END_d9a54e8a69f5e98ed85042afad984141 -->

<!-- START_51be948f31cfcf26abec6252477d47e4 -->
## api/admin/appointments
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/appointments`


<!-- END_51be948f31cfcf26abec6252477d47e4 -->

<!-- START_b6cb9b8ee84597ff0d30301f3ef0c199 -->
## api/admin/appointments/{appointment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/appointments/{appointment}`


<!-- END_b6cb9b8ee84597ff0d30301f3ef0c199 -->

<!-- START_31af0cc39b76cad52a9b710b559d2917 -->
## api/admin/appointments/{appointment}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/appointments/{appointment}`

`PATCH api/admin/appointments/{appointment}`


<!-- END_31af0cc39b76cad52a9b710b559d2917 -->

<!-- START_7819041ff4e549754892795e2b5bb932 -->
## api/admin/appointments/{appointment}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/appointments/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/appointments/{appointment}`


<!-- END_7819041ff4e549754892795e2b5bb932 -->

<!-- START_330ea83f55f222feb27ea9e2b0b53255 -->
## api/admin/dashboard/order-analytics
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/order-analytics" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/order-analytics"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/dashboard/order-analytics`


<!-- END_330ea83f55f222feb27ea9e2b0b53255 -->

<!-- START_ca1fcc38207ddde3ef20f8abee686d2c -->
## api/admin/dashboard/progress-info
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/progress-info" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/progress-info"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/dashboard/progress-info`


<!-- END_ca1fcc38207ddde3ef20f8abee686d2c -->

<!-- START_b8cd042aed424dc5aaa06f4ecdfa9989 -->
## api/admin/dashboard/active-order-locations
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/active-order-locations" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/dashboard/active-order-locations"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/dashboard/active-order-locations`


<!-- END_b8cd042aed424dc5aaa06f4ecdfa9989 -->

<!-- START_7434c3c603d2152d13eed1a88027c97b -->
## api/coupons
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/coupons`


<!-- END_7434c3c603d2152d13eed1a88027c97b -->

<!-- START_da2f0061b05003a0c5f0c9d78df1a91f -->
## api/vendors/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/list`


<!-- END_da2f0061b05003a0c5f0c9d78df1a91f -->

<!-- START_36f5888fe8bce09ddad954f2e83f3c7e -->
## api/vendors/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/{vendor}`


<!-- END_36f5888fe8bce09ddad954f2e83f3c7e -->

<!-- START_a39db7f14a1fccdc305a750879a0e831 -->
## api/vendors/ratings/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/ratings/{vendor}`


<!-- END_a39db7f14a1fccdc305a750879a0e831 -->

<!-- START_72fb18c3f2ed8b7a5522a99f4069647f -->
## api/vendors/ratings/summary/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/ratings/summary/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/ratings/summary/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/ratings/summary/{vendor}`


<!-- END_72fb18c3f2ed8b7a5522a99f4069647f -->

<!-- START_86e0ac5d4f8ce9853bc22fd08f2a0109 -->
## api/products
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/products`


<!-- END_86e0ac5d4f8ce9853bc22fd08f2a0109 -->

<!-- START_a285e63bc2d1a5b9428ae9aed745c779 -->
## api/products/{product}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/products/{product}`


<!-- END_a285e63bc2d1a5b9428ae9aed745c779 -->

<!-- START_c44dbda983adde509ec0b2030c402215 -->
## api/products/ratings/{product}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/products/ratings/{product}`


<!-- END_c44dbda983adde509ec0b2030c402215 -->

<!-- START_0b5877c48ce7f1286b52c4e9c756ceae -->
## api/products/ratings/vendor/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/vendor/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/vendor/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/products/ratings/vendor/{vendor}`


<!-- END_0b5877c48ce7f1286b52c4e9c756ceae -->

<!-- START_cfdced67ce45e5c934f4e6c859606bfe -->
## api/products/ratings/summary/{product}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/summary/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/summary/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/products/ratings/summary/{product}`


<!-- END_cfdced67ce45e5c934f4e6c859606bfe -->

<!-- START_4054800882558e8a5d951bcfe6859354 -->
## api/authetication-delegations/authenticate
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/authetication-delegations/authenticate" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/authetication-delegations/authenticate"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/authetication-delegations/authenticate`


<!-- END_4054800882558e8a5d951bcfe6859354 -->

<!-- START_a722ec6363335cb3a3efeb8ca380f479 -->
## api/appointment
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/appointment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/appointment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/appointment`


<!-- END_a722ec6363335cb3a3efeb8ca380f479 -->

<!-- START_3b69b9395e684a2b1547707d6192d3a5 -->
## api/appointment
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/appointment" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/appointment"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/appointment`


<!-- END_3b69b9395e684a2b1547707d6192d3a5 -->

<!-- START_3d940bb9cd00780eea6aa9dbb90a7268 -->
## api/appointment/{appointment}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/appointment/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/appointment/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/appointment/{appointment}`


<!-- END_3d940bb9cd00780eea6aa9dbb90a7268 -->

<!-- START_285c87403b6cfdebe26bc357f22e870f -->
## api/orders
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/orders`


<!-- END_285c87403b6cfdebe26bc357f22e870f -->

<!-- START_4a2c4a092aeef49b713d33a81056c185 -->
## api/orders/{order}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/orders/{order}`


<!-- END_4a2c4a092aeef49b713d33a81056c185 -->

<!-- START_03c1b0544be45c4d02871d09590c7263 -->
## api/coupons/check-validity
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons/check-validity" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons/check-validity"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/coupons/check-validity`


<!-- END_03c1b0544be45c4d02871d09590c7263 -->

<!-- START_efef88a76939a558d04e0da3ef4589c2 -->
## api/coupons
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/coupons`


<!-- END_efef88a76939a558d04e0da3ef4589c2 -->

<!-- START_b2cd59c7f0a455da31cc7510bf59616c -->
## api/coupons/{coupon}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/coupons/{coupon}`


<!-- END_b2cd59c7f0a455da31cc7510bf59616c -->

<!-- START_cc076cd03f2f1756b8b007510a56e8db -->
## api/coupons/{coupon}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/coupons/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/coupons/{coupon}`


<!-- END_cc076cd03f2f1756b8b007510a56e8db -->

<!-- START_05b4383f00fd57c4828a831e7057e920 -->
## api/products
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/products`


<!-- END_05b4383f00fd57c4828a831e7057e920 -->

<!-- START_ee1f72b9af11bee8697caa05af977247 -->
## api/products/{product}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/products/{product}`


<!-- END_ee1f72b9af11bee8697caa05af977247 -->

<!-- START_8cfbdc9dc632c59d7781f6333b5af7be -->
## api/products/{product}/stock
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/1/stock" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/1/stock"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/products/{product}/stock`


<!-- END_8cfbdc9dc632c59d7781f6333b5af7be -->

<!-- START_1fc0850d85762f609f2ac58d92573d6a -->
## api/products/ratings/{product}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/products/ratings/{product}`


<!-- END_1fc0850d85762f609f2ac58d92573d6a -->

<!-- START_49cd6bb170a56037c34942f1e0e06003 -->
## api/products/favourites/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/favourites/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/favourites/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/products/favourites/list`


<!-- END_49cd6bb170a56037c34942f1e0e06003 -->

<!-- START_af28126e4a52ed82b5eed57bb1d0e1d0 -->
## api/products/favourites/{product}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/favourites/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/products/favourites/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/products/favourites/{product}`


<!-- END_af28126e4a52ed82b5eed57bb1d0e1d0 -->

<!-- START_f42e87598c8353944d88aa8de3b294a1 -->
## api/vendors
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors`


<!-- END_f42e87598c8353944d88aa8de3b294a1 -->

<!-- START_06725dccba600290b767b18b069df1fe -->
## api/vendors/{vendor}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/vendors/{vendor}`


<!-- END_06725dccba600290b767b18b069df1fe -->

<!-- START_bf061d8da0dc8ec50adc144cd1ac80bb -->
## api/vendors/insights/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/insights/{vendor}`


<!-- END_bf061d8da0dc8ec50adc144cd1ac80bb -->

<!-- START_b5444e7fb6ea20e538549e3bf7247d3f -->
## api/vendors/insights-order-type/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights-order-type/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights-order-type/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/insights-order-type/{vendor}`


<!-- END_b5444e7fb6ea20e538549e3bf7247d3f -->

<!-- START_801b23e4f60f74032b1597e4f8e3731e -->
## api/vendors/insights-categories/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights-categories/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights-categories/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/insights-categories/{vendor}`


<!-- END_801b23e4f60f74032b1597e4f8e3731e -->

<!-- START_61a6bbaf4fbcf77ad08e0987191fcea8 -->
## api/vendors/insights-feedback/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights-feedback/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/insights-feedback/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/insights-feedback/{vendor}`


<!-- END_61a6bbaf4fbcf77ad08e0987191fcea8 -->

<!-- START_3640e0d1235824b3be2b51549a53d20e -->
## api/vendors/ratings/{vendor}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/ratings/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/vendors/ratings/{vendor}`


<!-- END_3640e0d1235824b3be2b51549a53d20e -->

<!-- START_5ce08ea3178d123822cda15408acb367 -->
## api/vendors/favourites/list
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/favourites/list" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/favourites/list"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/favourites/list`


<!-- END_5ce08ea3178d123822cda15408acb367 -->

<!-- START_890942b880f3c2302b8c4526b95c2cc5 -->
## api/vendors/favourites/{vendor}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/favourites/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/favourites/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/vendors/favourites/{vendor}`


<!-- END_890942b880f3c2302b8c4526b95c2cc5 -->

<!-- START_78df8e54a82ef9b95ae9c860e8e5b670 -->
## api/vendors/feedback/{vendor}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/feedback/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/feedback/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/vendors/feedback/{vendor}`


<!-- END_78df8e54a82ef9b95ae9c860e8e5b670 -->

<!-- START_56bf1be9823735c52a30db73daffffbe -->
## api/vendors/feedback/{vendor}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/feedback/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/feedback/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/vendors/feedback/{vendor}`


<!-- END_56bf1be9823735c52a30db73daffffbe -->

<!-- START_76ec7519f1b2cdb0c77797e148281224 -->
## api/vendors/feedback-submit/{vendor}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/feedback-submit/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/vendors/feedback-submit/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/vendors/feedback-submit/{vendor}`


<!-- END_76ec7519f1b2cdb0c77797e148281224 -->

<!-- START_f62d434079dff3acd53aa774d160d2ad -->
## api/addresses
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/addresses`


<!-- END_f62d434079dff3acd53aa774d160d2ad -->

<!-- START_c8fad65a796e6206c26cb584c46221b7 -->
## api/addresses
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/addresses`


<!-- END_c8fad65a796e6206c26cb584c46221b7 -->

<!-- START_c582a8517bbeef6a1e9e4a38334ecbcf -->
## api/addresses/{address}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/addresses/{address}`


<!-- END_c582a8517bbeef6a1e9e4a38334ecbcf -->

<!-- START_e5d3d7a19170fe1ef6901a6ddf8eaeae -->
## api/addresses/{address}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/addresses/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/addresses/{address}`


<!-- END_e5d3d7a19170fe1ef6901a6ddf8eaeae -->

<!-- START_96ed66d9e6531df9b49e02d84ca5a619 -->
## api/customers
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/customers`


<!-- END_96ed66d9e6531df9b49e02d84ca5a619 -->

<!-- START_089467e7ea475fb2aca445b2d23f6e7d -->
## api/customers
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/customers`


<!-- END_089467e7ea475fb2aca445b2d23f6e7d -->

<!-- START_9c3d56ca438bc61f264f75d157cf51bd -->
## api/customers/{customer}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/customers/{customer}`

`PATCH api/customers/{customer}`


<!-- END_9c3d56ca438bc61f264f75d157cf51bd -->

<!-- START_92d13d95887bbc9f105182378dcca720 -->
## api/customers/{customer}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/customers/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/customers/{customer}`


<!-- END_92d13d95887bbc9f105182378dcca720 -->

<!-- START_c1dea67f6b09cfa74a6edbe8c5a5048b -->
## api/orders/calculate-delivery-fee
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders/calculate-delivery-fee" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders/calculate-delivery-fee"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/orders/calculate-delivery-fee`


<!-- END_c1dea67f6b09cfa74a6edbe8c5a5048b -->

<!-- START_f9301c03a9281c0847565f96e6f723de -->
## api/orders
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/orders`


<!-- END_f9301c03a9281c0847565f96e6f723de -->

<!-- START_7e6be1b9dd04564a7b1298dd260f3183 -->
## api/orders/{order}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/orders/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/orders/{order}`


<!-- END_7e6be1b9dd04564a7b1298dd260f3183 -->

<!-- START_7e997cc9b64c8facc80f578ace24baf7 -->
## api/delivery
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/delivery`


<!-- END_7e997cc9b64c8facc80f578ace24baf7 -->

<!-- START_b4bc2a2d88c5992380849263413e01fe -->
## api/delivery/{delivery}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/delivery/{delivery}`


<!-- END_b4bc2a2d88c5992380849263413e01fe -->

<!-- START_fd2fb9450e3c42b0ec653878b3f3770e -->
## api/delivery/{delivery}/summary
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1/summary" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1/summary"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/delivery/{delivery}/summary`


<!-- END_fd2fb9450e3c42b0ec653878b3f3770e -->

<!-- START_61d98e78369442e204928e5b9c819fba -->
## api/delivery/{delivery}/order
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1/order" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1/order"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/delivery/{delivery}/order`


<!-- END_61d98e78369442e204928e5b9c819fba -->

<!-- START_0cdd336e909856de3f45dbcdf48d7c14 -->
## api/delivery/{delivery}/request
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1/request" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/1/request"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/delivery/{delivery}/request`


<!-- END_0cdd336e909856de3f45dbcdf48d7c14 -->

<!-- START_ed8d830278a8d92f09ff0ee175a2bdb0 -->
## api/delivery/request/{deliveryRequest}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/request/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery/request/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/delivery/request/{deliveryRequest}`


<!-- END_ed8d830278a8d92f09ff0ee175a2bdb0 -->

<!-- START_dc12d7bab8639dd6a7ac8a3332c86e18 -->
## api/delivery-modes
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery-modes" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/delivery-modes"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/delivery-modes`


<!-- END_dc12d7bab8639dd6a7ac8a3332c86e18 -->

<!-- START_9d9676d033ac6c4855503fea76c28b3d -->
## api/authetication-delegations
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/authetication-delegations" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/authetication-delegations"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/authetication-delegations`


<!-- END_9d9676d033ac6c4855503fea76c28b3d -->

<!-- START_e1b32c9bf703332d43116f4a285b5104 -->
## api/authetication-delegations
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/authetication-delegations" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/authetication-delegations"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/authetication-delegations`


<!-- END_e1b32c9bf703332d43116f4a285b5104 -->

<!-- START_cc64c07d415909496d2e2c1e9fb5f48a -->
## api/admin/faqs
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/faqs`


<!-- END_cc64c07d415909496d2e2c1e9fb5f48a -->

<!-- START_0d66ec574eb4778d4db9807eef7bfd50 -->
## api/admin/faqs
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/faqs`


<!-- END_0d66ec574eb4778d4db9807eef7bfd50 -->

<!-- START_4e69748f0bc7bb15866decf7287b198e -->
## api/admin/faqs/{faq}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/faqs/{faq}`


<!-- END_4e69748f0bc7bb15866decf7287b198e -->

<!-- START_4b7aaf4e4cdc37712595f9d35ee64512 -->
## api/admin/faqs/{faq}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/faqs/{faq}`

`PATCH api/admin/faqs/{faq}`


<!-- END_4b7aaf4e4cdc37712595f9d35ee64512 -->

<!-- START_091e2aea401ca074ded3bece12d74481 -->
## api/admin/faqs/{faq}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/faqs/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/faqs/{faq}`


<!-- END_091e2aea401ca074ded3bece12d74481 -->

<!-- START_0083031d044d624bfe8b543d684910d7 -->
## api/admin/paymentmethods
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/paymentmethods`


<!-- END_0083031d044d624bfe8b543d684910d7 -->

<!-- START_59be74dc34d603848f91169683d38457 -->
## api/admin/paymentmethods
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/admin/paymentmethods`


<!-- END_59be74dc34d603848f91169683d38457 -->

<!-- START_afc9f9891e5d287a1f4900589d588a13 -->
## api/admin/paymentmethods/{paymentmethod}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/paymentmethods/{paymentmethod}`


<!-- END_afc9f9891e5d287a1f4900589d588a13 -->

<!-- START_a51d02adb6413b7266d85ad714428517 -->
## api/admin/paymentmethods/{paymentmethod}
> Example request:

```bash
curl -X PUT \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/admin/paymentmethods/{paymentmethod}`

`PATCH api/admin/paymentmethods/{paymentmethod}`


<!-- END_a51d02adb6413b7266d85ad714428517 -->

<!-- START_26f68efc8498c55158868a0809df237c -->
## api/admin/paymentmethods/{paymentmethod}
> Example request:

```bash
curl -X DELETE \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/paymentmethods/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "DELETE",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`DELETE api/admin/paymentmethods/{paymentmethod}`


<!-- END_26f68efc8498c55158868a0809df237c -->

<!-- START_5649414466f85d2a1a0155f1a0af0d0f -->
## api/payment/methods
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/methods" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/methods"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/methods`


<!-- END_5649414466f85d2a1a0155f1a0af0d0f -->

<!-- START_c82177c747816e6ff2b3f0530d283e4c -->
## api/payment/stripe/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/stripe/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/stripe/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/stripe/{payment}`


<!-- END_c82177c747816e6ff2b3f0530d283e4c -->

<!-- START_13a756da6e6aef83a0616d3c0266c6b7 -->
## api/payment/payu/{payment}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/payu/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/payu/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/payment/payu/{payment}`


<!-- END_13a756da6e6aef83a0616d3c0266c6b7 -->

<!-- START_73be531bf5c39b7eea638662a72a6465 -->
## api/payment/paystack/callback/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/paystack/callback/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/paystack/callback/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/paystack/callback/{payment}`


<!-- END_73be531bf5c39b7eea638662a72a6465 -->

<!-- START_74b9b0fedaa435a3472974d6465217fb -->
## api/payment/paystack/status/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/paystack/status/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/paystack/status/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/paystack/status/{payment}`


<!-- END_74b9b0fedaa435a3472974d6465217fb -->

<!-- START_2ce859694b85616c3bc42bdef1b2fae6 -->
## api/payment/paystack/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/paystack/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/paystack/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/paystack/{payment}`


<!-- END_2ce859694b85616c3bc42bdef1b2fae6 -->

<!-- START_7afa9553b71574426b141169a853d370 -->
## api/payment/wallet/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/wallet/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/wallet/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/wallet/{payment}`


<!-- END_7afa9553b71574426b141169a853d370 -->

<!-- START_1cd5102167f03827725cd3bf0eb1d968 -->
## api/payment/authorize-net/{payment}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/authorize-net/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/authorize-net/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/payment/authorize-net/{payment}`


<!-- END_1cd5102167f03827725cd3bf0eb1d968 -->

<!-- START_a7816b01543ea4f37ddaaf26e9c1d709 -->
## api/payment/bambora/{payment}
> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/bambora/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/bambora/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/payment/bambora/{payment}`


<!-- END_a7816b01543ea4f37ddaaf26e9c1d709 -->

<!-- START_7be51bab152aa08a86b21fa453cc79bf -->
## api/payment/telebirr/callback/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/telebirr/callback/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/telebirr/callback/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/telebirr/callback/{payment}`


<!-- END_7be51bab152aa08a86b21fa453cc79bf -->

<!-- START_d39f10136cd070401ed1acbe056e822c -->
## api/payment/telebirr/status/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/telebirr/status/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/telebirr/status/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/telebirr/status/{payment}`


<!-- END_d39f10136cd070401ed1acbe056e822c -->

<!-- START_9338d87b0d583dd2b4f9850fba8fb2e2 -->
## api/payment/telebirr/{payment}
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/telebirr/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/payment/telebirr/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/payment/telebirr/{payment}`


<!-- END_9338d87b0d583dd2b4f9850fba8fb2e2 -->

<!-- START_cbeb8ab6260228b207b869ab61d6ff70 -->
## api/admin/supports
> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/supports" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/api/admin/supports"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (429):

```json
{
    "message": "Too Many Attempts."
}
```

### HTTP Request
`GET api/admin/supports`


<!-- END_cbeb8ab6260228b207b869ab61d6ff70 -->

<!-- START_e1605a6e5ceee9d1aeb7729216635fd7 -->
## Display the password reset view for the given token.

If no token is present, display the link request form.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/password/reset/1" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/password/reset/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET password/reset/{token}`


<!-- END_e1605a6e5ceee9d1aeb7729216635fd7 -->

<!-- START_cafb407b7a846b31491f97719bb15aef -->
## Reset the given user&#039;s password.

> Example request:

```bash
curl -X POST \
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/password/reset" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/password/reset"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST password/reset`


<!-- END_cafb407b7a846b31491f97719bb15aef -->

<!-- START_53be1e9e10a08458929a2e0ea70ddb86 -->
## Show the application dashboard.

> Example request:

```bash
curl -X GET \
    -G "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json"
```

```javascript
const url = new URL(
    "http://doctoworld-env-1.eba-p3t6ppcj.us-east-1.elasticbeanstalk.com/doctoworld/public/"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
null
```

### HTTP Request
`GET /`


<!-- END_53be1e9e10a08458929a2e0ea70ddb86 -->


