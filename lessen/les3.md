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

// TODO: vergelijken met Laravel index.php?

De React applicatie leest de URL en kiest op basis daarvan welk component geladen moet worden. Wanneer de gebruiker
bijvoorbeeld naar `/home` navigeert, zorgt `react-router` ervoor dat het juiste component (bijv. `HomeComponent`) wordt
weergegeven.

### react-router

// TODO: React Router 7 is uit en werkt anders? Ziet er minder inzichtelijk uit => uitproberen

Verschillende manieren om routing toe te passen binnen React. Wij gebruiken `createBrowserRouter` omdat we dit de beste
manier vinden. Helaas is deze niet het best gedocumenteerd.

`createBrowserRouter` buiten project aanmaken
Hierin routes (`paths`) mappen naar components (`element`)
Nesten kan (`children`)
Variabelen uit URL in `params`

`<Outlet />` bepaalt waar component komt

#### Opdracht

Voeg routing toe

## PUT en DELETE

PUT zelfde als POST, DELETE eenvoudigste method

#### Opdracht

Maak de delete

#### Opdracht

Maak de edit

#### Opdracht (extra)

pagination op overzicht

#### Opdracht (extra)

filtering op overzicht