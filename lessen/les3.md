# Les 3

## Front-end routing

Omdat je in React een *single page application* bouwt, draait de hele app op één url. Dit is voor de gebruikerservaring
echter niet handig omdat deze je dan niet kunt linken naar een onderdeel van je applicatie. Dit kunnen we oplossen door
*front-end routing* toe te voegen.

- **Usability**: Gebruikers kunnen tussen verschillende delen van de applicatie navigeren via de URL, of terugkeren naar
  een 'plek' in je webapplicatie (bookmarks).

Bij front-end routing wordt de navigatie volledig beheerd door de client, toch is daarnaast ook back-end routing nodig
om te zorgen dat alle url's naar je single page application gestuurd worden. De server routeert dus elk request naar
`index.html`.

<!-- // TODO: in les vergelijken met Laravel index.php? -->

De React applicatie leest de URL en kiest op basis daarvan welk component geladen moet worden. Wanneer de gebruiker
bijvoorbeeld naar `/home` navigeert, zorgt `react-router` ervoor dat het juiste component (bijv. `HomeComponent`) wordt
weergegeven.

### react-router

Er zijn verschillende manieren om routing toe te passen binnen React. Wij gebruiken `createBrowserRouter` omdat we dit
de beste
manier vinden. Helaas is deze niet het best gedocumenteerd.

* Gebruik `createBrowserRouter` in de App.jsx om een router aan te maken
* Definieer daarin de hoofd routes (`paths`) naar components (`element`)
* Definieer eventueel geneste routes (`children`)
* Als je variabelen in een URL gebruikt kan je die in het component ophalen met `useParams`
* Met een `<Outlet />` bepaal je waar het component gerenderd wordt
* Als structuur is het handig om met een algemene layout te beginnen, met je andere components als children

```javascript
import {createBrowserRouter, RouterProvider} from 'react-router';
// import je components
import Layout from './Layout.jsx';

const router = createBrowserRouter([
    {
        element: <Layout/>,
        children: [
            {
                path: '/',
                element: <Home/>,
            },
            {
                path: '/create',
                element: <CreateProduct/>,
            },

            {
                path: '/products/:id',
                element: <ProductDetail/>,
            },
        ]
    }
]);

function App() {
    return <RouterProvider router={router}/>;
}

export default App;
```

```javascript
import {Link, Outlet} from 'react-router';

function Layout() {
    return (
        <div>
            <header>
                <nav>
                    <Link to={`/`}>Home</Link>
                    <Link to={`/create`}>Create New Product</Link>
                </nav>
            </header>
            <main>
                <Outlet/>
            </main>
        </div>
    );
}

export default Layout;
```

Op onderstaande blogs kan je extra voorbeelden vinden:

* https://medium.com/@pavitramodi.it/getting-started-with-createbrowserrouter-in-react-router-dom-e3131820fef4
* https://codeparrot.ai/blogs/createbrowserrouter-a-step-up-from-switch

#### Opdracht 3.1

Voeg routing aan je project toe om aparte pagina's te maken van:

* de collectie
* de detail weergave
* het create formulier

## PUT en DELETE

PUT wordt gebruikt om een resource aan te passen en werkt vrijwel hetzelfde als POST. Je kunt net als bij POST in de
body een resource naar de webservice sturen. Het verschil is dat je deze resource niet naar de collectie stuurt, maar
naar de detail resource die overschreven wordt met deze nieuwe resource.

Om een resource te verwijderen kan je de DELETE method gebruiken.

#### Opdracht 3.2

Voeg aan je applicatie toe dat je resources kunt verwijderen

#### Opdracht 3.3

Voeg aan je applicatie toe dat je resources kunt aanpassen

#### Opdracht 3.4 (extra)

Voeg pagination toe aan je overzichtspagina.

* Je kunt dit helemaal zelf implementeren door de resulaten zelf 'op te knippen',
* Je kunt dit ook door de webservice laten doen, door gebruik te maken van de parameters `page` en `limit`. Als je deze
  gebruikt kan je in het pagination object van de collectie links vinden om door de resultaten te bladeren.

#### Opdracht 3.5 (extra)

Voeg een zoek en/of filter optie toe. 