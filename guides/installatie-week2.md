# Installatie Back-end

## Les 4

<!-- Martijn: nog dingen tegen gekomen bij installatie op de server -->

* Installeer node op de server
  **Ubuntu** https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04
* Express project
  https://expressjs.com/en/starter/installing.html
  (Wij gebruiken `import` en geen `require`. Let daarom op dat je je project type op `module` zet)

<!--
// TODO windows vs mac os installaties van mongo
// TODO: auto start (daemon) op beiden checken
// TODO: check verschil in brew start commando;s (lesbrief vs site)
-->

## Les 5

* mongodb (lokaal + server)
  **Mac OS**: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/
  (het is het handigst om hem als service te starten na installatie:
  brew services start mongodb-community@8.0)
  **Windows**: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-windows/
  (het is het handigst om als service te installeren).
  **Ubuntu** https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/
*
* npm install mongoose

## Les 8

laatste week
npm install jsonwebtoken