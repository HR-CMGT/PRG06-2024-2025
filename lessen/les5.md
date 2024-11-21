# Les 5

## MongoDB

*MongoDB* is een NoSQL-database die gegevens opslaat in documenten, in plaats van in tabellen zoals bij relationele
databases. Gegevens worden opgeslagen als een soort JSON.

## Mongoose

De module *Mongoose* is een object-document mapper (ODM) voor *MongoDB*. Hiermee kunnen we vanuit JavaScript
communiceren met de database.
Ook kunnen we in Mongoose modellen (schema's) maken voor objecten in de ongestructureerde database.

// TODO: opdracht seeder (POST overload)

// TODO: GET op collectie en detail

## POST en PUT

json / www-urlencoded

// TODO: extra uitleg over json (structuur en datatypes)

// TODO: Opdracht POST, PUT, DELETE

## Status Codes

HTTP-statuscodes bestaan uit drie cijfers. Het eerste cijfer is de serie, en geeft aan in hoeverre de server er in
geslaagd is aan het request te voldoen. De laatste twee cijfers zijn voor meer gedetailleerde informatie. 00 wordt
gebruikt als er geen details zijn, of er geen specifieke code bestaat voor de details.

Een volledig overzich van alle statuscodes kan je vinden
op [Wikipdia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes).

### 2xx – Succes

Statuscodes in de 2xx-serie geven aan dat het request succesvol is verwerkt door de server.

- **200 OK**  
  Het request is geslaagd en de server heeft een response gestuurd.

- **201 Created**  
  Er is een nieuwe resource aangemaakt. Dit wordt gebruikt bij een POST-request.

### 4xx – Clientfout

Statuscodes in de 4xx-serie geven aan dat er iets mis is met het request van de client waardoor de server het request
niet kan verwerken.

- **401 Unauthorized**  
  De server kan het request niet verwerken omdat je niet ingelogd bent wat je wel had moeten zijn..

- **404 Not Found**  
  De resource bestaat niet op de server.

### 5xx – Serverfout

Statuscodes in de 5xx-serie geven aan dat de server een interne fout heeft ondervonden bij het verwerken van het
request. Het request is wel correct, de gebruiker kan hier zelf dus niets aan doen.

- **500 Internal Server Error**  
  Er is een algemene fout op de server opgetreden. Meest frustrerende fout: er is een probleem op de server, en je weet
  niet eens wat..

- **503 Service Unavailable**  
  De server is overbelast, of tijdelijk uit de lucht voor onderhoud.

## Server

Screen, rechten, mongo

## Postman vervolg?

## URI

*URI* staat voor **Uniform Resource Identifier** en verwijst naar een resource (identifier). In veel gevallen gebruiken
we de term *URI* in de context van webservices, omdat het
om het identificeren van een resource gaat. Omdat de identifier ook de locatie aangeeft is de URI ook een **URL** (
Uniform
Resource Locator).

### Opbouw

```
scheme://host/path?query#fragment
```

- **scheme**: Het protocol waarmee de resource benaderd kan worden (bijvoorbeeld `http`, `https`).
- **host**: Het domein of IP-adres van de server waar de resource zich bevindt (bijvoorbeeld `www.example.com`).
- **port** (optioneel): De poortnummer op de server waarmee de client verbinding maakt (standaard is dit 80 voor HTTP en
  443 voor HTTPS).
- **path**: Het pad naar de specifieke resource op de server (bijvoorbeeld `/products/1`).
- **query** (optioneel): Een reeks parameters voor de resource (
  bijvoorbeeld `?category=books`).
- **fragment** (optioneel): Een verwijzing naar een specifiek deel van de resource (bijvoorbeeld `#section2`).

**Voorbeeld**

```
https://www.example.com/products/1?category=books#section2
```

<!--
In dit geval:

- Het **scheme** is `https`,
- De **host** is `www.example.com`,
- Het **path** is `/products/1`,
- De **query** is `?category=books`,
- Het **fragment** is `#section2`.
-->

## Meer over headers

// TODO:

* versiebeheer in URI toevoegen?
* verdeling van de lessen nalopen (lijkt wel erg veel in deze les, misschien kan mongo naar 4? Of anders PUT naar 6?)

// TODO technieken:

* mongoose schema
* find
* try/catch (zit ook al bij fetch)
* headers
* statuscodes
* middleware (ook gebruiken om item aan request toe te voegen?)
* save en ValidationError of beter gewoon checken van lege velden?