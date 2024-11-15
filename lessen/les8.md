# Les 9

## JWT

Doel: authenticatie en authorisatie check, zonder steeds te moeten authenticeren (inloggen)

### Voordelen

- servers om in te loggen hoeft niet dezelfde te zijn als waar de check plaatsvindt
- Gebruiker kan inloggen waarna Javascript Fetch het token kan gebruiken (zolang het geldig is)

### Proces

- Gebruiker logt in op autheticatieserver
- Autheticatieserver creert een JWT
- Client stuurt token mee met elk request naar applicatieserver
- Applicatieserver (zonder autheticatieserver) kan zelf dit token valideren dankzij shared secret

### HTTP authetication

```
WWW-Authenticate: <type> realm=<realm>
```

```
Authorization: <type> <credentials>
```

Uitzoeken: proxy-auth

### Basic

```
WWW-Authenticate: <type> realm=<realm>
```

```
Authorization: <type> <credentials>
```

### Bearer

```
Authorization: Bearer <token>
```

### Overzicht requests en responses

401 (no or invalid) vs 403 (no priviledges, nvt)

### HTTPS

Uitleg, maar vooral boodschap dat wat we nu doen alleen tijdens oefenen kan, en je authenticatie altijd in combinatie
met https moet gebruiken

* [JWT](https://jwt.io)
* [Base64](https://www.base64encode.org)
* [http auth](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication)