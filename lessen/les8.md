# Les 8

## POST Overloading

Het HTTP protocol heeft slechts een beperkte set aan methods (`GET`, `POST`, `PUT`, etc.). Soms wil je met resource
dingen doen die hier niet in voorkomen. We gebruiken in dat geval altijd de method `POST`. Omdat dit de enige method is
die niet safe, en niet indempotent hoeft te zijn weten we zeker dat een client hier altijd 'voorzichtig' mee zal zijn.
Omdat het geen normale `POST` is sturen we in het request een variable `method` mee waarin we de echte method zetten,
bijv `method=UNDELETE`.
We noemen dit principe *POST overloading* omdat we een `POST` een andere betekenis geven.
Het meesturen van de echte method in een aparte variabele is niet alleen voor de duidelijkheid, maar ook omdat het
daardoor mogelijk is om een POST overload naast een normale `POST` te gebruiken, of meerdere overloads voor één endpoint
te definieren.

### Voorbeeld

In les 5 hebben we een aparte route `seed` gemaakt om nieuwe items aan te maken. Met een POST overload kunnen we dit
netter doen, door de seeder gewoon op de collectie te zetten met `method=SEED`.

## JWT

Doel: authenticatie en authorisatie check, zonder steeds te moeten authenticeren (inloggen)

### Voordelen

- servers om in te loggen hoeft niet dezelfde te zijn als waar de check plaatsvindt
- Gebruiker kan inloggen waarna Javascript Fetch het token kan gebruiken (zolang het geldig is)

### Proces

- Gebruiker logt in op autheticatieserver
- Authenticatieserver creëert een JWT
- Client stuurt token mee met elk request naar applicatieserver
- Applicatieserver (zonder autheticatieserver) kan zelf dit token valideren dankzij shared secret

### HTTP authentication

```
WWW-Authenticate: <type> realm=<realm>
```

```
Authorization: <type> <credentials>
```

<!--
Uitzoeken: proxy-auth
-->

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

btoa atob

#### Opdracht

* Ga naar: https://www.base64decode.org/
* Decodeer ‘SGVsbG8sIHdvcmxk’

#### Opdracht

Werken aan eindopdracht

* [JWT](https://jwt.io)
* [Base64](https://www.base64encode.org)
* [http auth](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication)