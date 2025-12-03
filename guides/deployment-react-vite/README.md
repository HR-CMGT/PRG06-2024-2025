# Installatie & Deployment React + Vite

- [Installatie \& Deployment React + Vite](#installatie--deployment-react--vite)
  - [Introductie](#introductie)
    - [Let op voor je aan de slag gaat!](#let-op-voor-je-aan-de-slag-gaat)
  - [Installatie](#installatie)
  - [Configuratie webserver](#configuratie-webserver)
  - [Deployen nieuwe versie](#deployen-nieuwe-versie)
  - [NIET DOEN: Domein met SSL Certificaat](#niet-doen-domein-met-ssl-certificaat)

## Introductie

Om je project op een onlineomgeving te krijgen ga je werken met een VPS. Als team heb je deze aangevraagd via school,
maar je kunt ook een eigen serveromgeving gebruiken.

Deze handleiding werkt met Ubuntu (v22.04 of v24.04) om de noodzakelijke tools te installeren, en te zorgen dat je een
werkende webserver hebt waar je Laravel project kan draaien.

### Let op voor je aan de slag gaat!

> - Je moet voor de stappen hieronder je logingegevens paraat hebben van de aanvraag voor de VM
> - Als je gegevens (zoals je wachtwoord) wilt kopiëren en plakken op Windows in Powershell moet je jouw rechtermuisknop
>   gebruiken om te plakken
> - Als er gevraagd wordt om een fingerprint toe te voegen moet je met "yes" antwoorden (dit wordt 2 keer gevraagd in
>   het proces)
> - Als er geen feedback komt vanuit de gedraaide commands is dat een goed teken. Als er wel feedback is, dan is dit
>   vaak een foutmelding.
> - Als je grote fouten krijgt, roep dan een technische docent erbij

## Installatie

Download de zip op jouw laptop en pak deze uit. Open je Terminal (mac) of Powershell (Windows) en navigeer naar de map
die net is uitgepakt. Zorg ervoor dat je in die map zit. Als je in de goede map staat kun je de bestanden uploaden naar
jullie server. Draai het volgende commando en vervang `<user>` en `<ip>` met je eigen gegevens (`<>` tekens moeten hier
niet meer staan na het aanpassen naar je eigen gegevens):

```bash
scp nginx.conf install_tools.sh configure_webserver.sh deploy.sh <user>@<ip>:~/
```

Log nu in op de server via:

```bash
ssh <user>@<ip>
```

> Vanaf nu ben je ingelogd op de server en voer je de commando's dus uit op de server en niet meer op je eigen laptop.

Controleer of het uploaden van de bestanden goed is gegaan door het volgende commando te draaien:

```bash
ls -al
```

Je zou nu de scripts moeten zien die je eerder op je eigen laptop hebt uitgepakt. Klopt dit? Dan kun je verder. Om de
scripts te kunnen draaien moet je ze qua rechten aanpassen zodat ze 'executable' zijn:

```bash
chmod u+x install_tools.sh configure_webserver.sh deploy.sh
```

Run nu onderstaand script en lees tijdens de installatie de uitleg die eronder staat:

```bash
./install_tools.sh
```

Hiermee worden alle noodzakelijke tools geïnstalleerd op de server. Het commando`sudo` geeft je meer rechten dan een
gewone gebruiker, maar zoals bekend 'with great powers, comes great responsibility'. Daarom moet je 1 keer opnieuw je
wachtwoord invullen om te controleren of je echt zelf nog achter de computer zit. Na voltooiing heb je het volgende
geïnstalleerd:

- Een aantal basispakketten voor webcommunicatie
- Git
- Nginx (webserver)
- NVM (met Node LTS & NPM)
- SSH key

⚠️ Test of de installatie goed is gegaan door naar http://\<jouw-ip> te gaan in de browser. Als je nu een nginx
startpagina ziet, is het goed gegaan en kun je door naar de volgende stap.

## Configuratie webserver

In plaats van de default nginx startpagina wil je uiteraard je eigen GitHub project hier zien.

Hiervoor moet je de SSH key van de server (die in de vorige stap is aangemaakt) toevoegen aan jouw GitHub project
deployment keys, zodat de server namens jou op GitHub kan inloggen

> ⚠️ Standaard heeft alleen de aanmaker van een repository toegang tot de settings

- Draai `cat ~/.ssh/id_rsa.pub` op de server om jouw key te kunnen zien
- Kopieer deze key (dus de hele output van het commando)
- Ga naar GitHub.com en open jouw repository
  - Ga naar **Settings** en daarbinnen naar **Deploy keys**
  - Voeg een nieuwe toe en plak hier jouw gekopieerde key
  - Geef als titel `hr-vm-tle2_1`
  - Laat het vinkje voor write access uitstaan

Run nu het volgende script. Let op, dit doe je **ZONDER** sudo (vul je wachtwoord in voor `sudo` wanneer hier tussendoor
om wordt gevraagd). Je krijgt 3 vragen waarvan de uitleg onder het commando staat:

```bash
./configure_webserver.sh
```

- Vraag 1: Vul hier je SSH GitHub link in (ziet eruit als `git@GitHub.com:<username>/<repo>.git`). Klik hiervoor op de
  groene knop **Code** op de startpagina van de repository en vervolgens op de tab **SSH**
- Vraag 2: De naam van je project ZONDER spaties of hoofdletters (bv: my-react-project)

> Na het draaien van dit script kun je opnieuw naar http://\<jouw-ip> gaan in de browser. Je zou hier nu je React
> applicatie werkend moeten zien draaien! 🚀

## Deployen nieuwe versie

Staat er een nieuw versie in de _main_ branche? Dan kun je dit met de volgende stappen deployen:

- Zorg ervoor dat je in de home folder zit. Dit is de map die standaard geopend wordt wanneer je inlogt met SSH. Mocht
  je toch niet in die map zitten, voer dan het volgende commando uit: `cd ~` (de ~ staat voor de home folder).
- Voer het commando `./deploy.sh` uit. Dit commando pulled de wijzigingen van _main_ en build het project met Vite
  (`npm run build`). De bestanden die daaruit komen worden verplaatst naar de juiste plek op de server, waarna de nieuwe
  versie online te zien is op `http://\<jouw-ip>`.

> Heb je meer nodig in je deployment flow, dan kun je het deploy script natuurlijk aanpassen.

## NIET DOEN: Domein met SSL Certificaat

De website draait nu op `http://\<jouw-ip>` en is door iedereen (binnen Nederland i.v.m. beveiliging in de Hogeschool
firewall) te bezoeken. De stap om ook echt een domeinnaam (hr.nl, mijn-website.nl, etc.) toe te voegen slaan we voor nu
over.

> **DIT DOEN WE OM DE KLANT TE BESCHERMEN EN GEEN WILDGROEI AAN DOMEINEN TE KRIJGEN DIE HELEMAAL NIET VAN EEN ECHTE
> OPDRACHTGEVER ZIJN**
