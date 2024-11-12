# Les 3

## Front-end routing

*Front-end routing* is het proces waarbij de navigatie in een webapplicatie volledig op de client (in de browser) wordt
beheerd, Inhoud wordt dynamisch geladen/getoond door de client op basis van de gebruikte URL.

**Doel:**

- **Usability**: Gebruikers kunnen tussen verschillende delen van de applicatie navigeren via de URL, of terugkeren naar
  een 'plek' in je webapplicatie (bookmarks).
- **SEO**: Front-end routing helpt zoekmachines de verschillende pagina's van een app te indexeren.

**Werking:**
In een *Single Page Application* zoals een React-app, wordt de navigatie volledig beheerd door de client. Er is slechts
één html pagina (`index.html`) die de server naar de client stuurt (de server routeert elk request naar `index.html`,
dit is vergelijkbaar met de backend routing in Laravel waar elk request naar `index.php` gaat).

Op basis van de URL wordt het juiste component geladen. Wanneer de gebruiker bijvoorbeeld naar `/home` navigeert, zorgt
`react-router` ervoor dat het juiste
component (bijv. `HomeComponent`) wordt weergegeven.

## PUT en DELETE

Fetch API

Opdracht: Maak de delete

Opdracht: Maak de edit

Opdracht: pagination op overzicht

Opdracht: filtering op overzicht