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

Met JWTs (JSON Web Tokens) kan je geauthenticeerd blijven zonder telkens opnieuw hoeven in te loggen.

* Gebruiker logt in op authenticatieserver
* Authenticatieserver creëert een JWT op basid van een *shared secret*
* Client stuurt token mee met elk request (`fetch`) naar applicatieserver
* Applicatieserver (zonder authenticatieserver) kan zelf dit token valideren dankzij shared secret

https://jwt.io

### HTTP authentication

Authentication onder http verloopt via de headers. De server stuurt een header om aan te geven dat authenticatie nodig
is, en welke methode er gebruikt wordt.

```
WWW-Authenticate: <type> realm=<realm>
```

De client kan dan credentials sturen om toegang te krijgen.

```
Authorization: <type> <credentials>
```

<!--
Uitzoeken: proxy-auth
-->

### Basic

Basic authentication werkt door een gebruikersnaam en wachtwoord te coderen in Base64 en deze mee te sturen:

```
WWW-Authenticate: Basic realm="example"
```

```
Authorization: Basic dXNlcm5hbWU6cGFzc3dvcmQ=
```

}

### Bearer

Bearer authentication gebruik je om in te loggen met een token.

Client stuurt een token:

```
Authorization: Bearer <token>
```

### Status

Bij authenticatie kunnen verschillende statuscodes worden teruggestuurd om aan te geven waarom toegang geweigerd wordt:

* **401 Unauthorized** De client heeft geen (geldige) authenticatiegegevens gestuurd

* **403 Forbidden** De client heeft onvoldoende rechten

### HTTPS

In een productieomgeving is het noodzakelijk om HTTPS te gebruiken in combinatie met authenticatie om ervoor te zorgen
dat paswoorden en tokens versleuteld verstuurd worden.

#### Opdracht 8.1

* Ga naar: https://www.base64decode.org/
* Decodeer ‘SGVsbG8sIHdvcmxk’

#### Opdracht 8.2

Ga verder met je eindopdracht

<!-- btoa atob in presentatie zetten? -->

* [JWT](https://jwt.io)
* [Base64](https://www.base64encode.org)
* [http auth](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication)