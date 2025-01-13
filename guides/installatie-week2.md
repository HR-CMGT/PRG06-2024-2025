# Installatie Back-end

## Les 4

**Lokaal**

* Express project
  https://expressjs.com/en/starter/installing.html

Wij gebruiken `import` en geen `require`. Zet daarom in 'package.json' het `type` op `module`.

```
{
    // voeg toe aan package.json
    "type": "module",        
}
```

**Server**

* Installeer node op de server

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install 22
```

(Bron: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04
option 3)

<!--
// TODO windows vs mac os installaties van mongo
// TODO: auto start (daemon) op beiden checken
// TODO: check verschil in brew start commando;s (lesbrief vs site)
-->

## Les 5

**Lokaal**

MongoDB

* **Mac OS**: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/

Het is het handigst om hem als service te starten na installatie:
`brew services start mongodb-community@8.0`

* **Windows**: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-windows/

Scroll omlaag voor 'Download Center'. Kies in voor een 'Complete' installatie, laat 'Install as service' aan staan, maar
let op dat je bij het volgende scherm waar gevraagd wordt of je Compass wilt installeren dit uit zet (is een opt out!),
want die hebben we niet nodig.

Mongoose

* `npm install mongoose`, in je node project.

Fakerjs

* Installeer module met `npm install @faker-js/faker`, in je node project.

**Server**

MongoDB

* **Ubuntu** https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

Screen (server)

* Installeer met `sudo apt install screen`.

## Les 8

* JSON web tokens `npm install jsonwebtoken`