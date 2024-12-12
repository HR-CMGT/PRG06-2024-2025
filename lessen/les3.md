# Les 3

## Front-end routing

Omdat je in React een *single page application* bouwt, draait de hele app op één url. Er zijn echter voordelen om
meerdere url's te hebben voor verschillende onderdelen van een web applicatie door *front-end routing* toe te voegen.

- **Usability**: Gebruikers kunnen tussen verschillende delen van de applicatie navigeren via de URL, of terugkeren naar
  een 'plek' in je webapplicatie (bookmarks).
- **SEO**: Front-end routing helpt zoekmachines de verschillende pagina's van een app te indexeren.

Bij front-end routing wordt de navigatie volledig beheerd door de client, toch is daarnaast ook back-end routing nodig
om te zorgen dat alle url's naar je single page application gestuurd worden. De server routeert dus elk request naar
`index.html`.

<!-- // TODO: in les vergelijken met Laravel index.php? -->

De React applicatie leest de URL en kiest op basis daarvan welk component geladen moet worden. Wanneer de gebruiker
bijvoorbeeld naar `/home` navigeert, zorgt `react-router` ervoor dat het juiste component (bijv. `HomeComponent`) wordt
weergegeven.

### react-router

Verschillende manieren om routing toe te passen binnen React. Wij gebruiken `createBrowserRouter` omdat we dit de beste
manier vinden. Helaas is deze niet het best gedocumenteerd.

* Gebruik `createBrowserRouter` buiten je project (in main.jsx) om een router aan te maken
* Definieer daarin de hoofd routes (`paths`) naar components (`element`)
* Definieer eventueel geneste routes (`children`)
* Als je variabelen in een URL gebruikt kan je die in het component ophalen met `useParams`
* Met een `<Outlet />` bepaal je waar het component gerenderd wordt

Op onderstaande blogs kan je voorbeelden vinden:

* https://medium.com/@pavitramodi.it/getting-started-with-createbrowserrouter-in-react-router-dom-e3131820fef4
* https://codeparrot.ai/blogs/createbrowserrouter-a-step-up-from-switch

#### Opdracht

Voeg routing aan je project toe om aparte pagina's te maken van:

* de collectie
* de detail weergave
* het create formulier

## PUT en DELETE

PUT wordt gebruikt om een resource aan te passen en werkt vrijwel hetzelfde als POST. Je kunt net als bij POST in de
body een resource naar de webservice sturen. Het verschil is dat je deze resource niet naar de collectie stuurt, maar
naar de detail resource die overschreven wordt met deze nieuwe resource.

Om een resource te verwijderen kan je de DELETE method gebruiken.

#### Opdracht

Voeg aan je applicatie toe dat je resources kunt verwijderen

#### Opdracht

Voeg aan je applicatie toe dat je resources kunt aanpassen

#### Opdracht (extra)

Voeg pagination toe aan je overzichtspagina.

* Je kunt dit helemaal zelf implementeren door de resulaten zelf 'op te knippen',
* Je kunt dit ook door de webservice laten doen, door gebruik te maken van de parameters `page` en `limit`. Als je deze
  gebruikt kan je in het pagination object van de collectie links vinden om door de resultaten te bladeren.

#### Opdracht (extra)

Voeg een zoek en/of filter optie toe. 