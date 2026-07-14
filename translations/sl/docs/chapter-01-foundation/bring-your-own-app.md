# Prinesi svojo aplikacijo - Dodaj azd k obstoječemu projektu

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Tvoj prvi projekt](first-project.md)
- **➡️ Naslednje**: [Razvojni kontejnerji in Codespaces](dev-containers.md)

> Preverjeno z `azd 1.27.1` julija 2026.

## Uvod

V [Tvoj prvi projekt](first-project.md) si namestil aplikacijo, tako da si začel s predlogo. Vendar največkrat že *imaš* aplikacijo – Node.js API, Python Flask storitev, .NET spletno aplikacijo – ki je shranjena v mapi na tvojem računalniku. Ta lekcija prikazuje, kako dodati azd k obstoječi kodi, da jo lahko namestiš z `azd up`, brez potrebe po predlogi.

## Cilji učenja

Na koncu te lekcije boš:
- Spoznal tri načine za začetek azd projekta
- Zagnal `azd init` znotraj obstoječe kode
- Razumel, kaj počneta datoteka `azure.yaml` in mapa `infra/` za tvojo aplikacijo
- Vedel, kdaj naj azd ustvari infrastrukturo in kdaj naj napišeš svojo
- Namestil svojo obstoječo aplikacijo v Azure z `azd up`

## Pričakovani rezultati učenja

Po končani lekciji boš znal:
- Inicializirati azd v projektu, ki ga že imaš
- Brati in urejati osnovno datoteko `azure.yaml`
- Ustvariti začetno infrastrukturo z `azd infra generate`
- Izbrati primeren gostitelj Azure za svojo aplikacijo
- Namestiti in očistiti svojo aplikacijo

---

## Trije načini za začetek azd projekta

| Začetna točka | Ukaz | Kdaj uporabiti |
|----------------|---------|-------------|
| **Iz predloge** | `azd init --template <name>` | Za učenje ali začetek nove aplikacije iz preverjenega vzorca |
| **Iz obstoječe kode** | `azd init` (v mapi projekta) | Če že imaš aplikacijo in jo želiš namestiti |
| **Iz Git repozitorija** | `azd init --from-code` (v kloniranem repozitoriju) | Sprejemanje azd za obstoječi repozitorij |

Že si vadil prvo možnost. Ta lekcija pokriva drugo – najpogostejši scenarij v praksi.

---

## Korak 1: Zaženi `azd init` v svojem projektu

Odpri terminal **znotraj mape svojega obstoječega projekta** in zaženi:

```bash
cd my-existing-app
azd init
```

azd bo vprašal, kako želiš inicializirati. Izberi:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Izberi **"Uporabi kodo v trenutnem imeniku."** azd bo nato pregledal tvojo mapo, zaznal programski jezik in okvir ter predlagal gostitelja.

### Kaj azd zazna

azd išče signale, kot so `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` ali `Dockerfile`, in predlaga ustreznega gostitelja Azure:

| Tvoja aplikacija | Verjetno zaznan gostitelj |
|----------|----------------------|
| Node.js / Python / .NET spletna aplikacija | Azure App Service ali Container Apps |
| Aplikacija v kontejnerju (`Dockerfile`) | Azure Container Apps |
| Funkcijska aplikacija | Azure Functions |
| Statična stran (izhod gradnje React/Vue) | Azure Static Web Apps |

Potrdi zaznano storitev(e), azd pa pripravi datoteke, ki jih potrebuješ.

---

## Korak 2: Razumi, kaj je azd ustvaril

Po inicializaciji boš imel v svojem projektu dve novi stvari:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicija projekta

To je jedro azd projekta. Minimalen primer izgleda tako:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je ključni del: vsak vnos povezuje mapo tvoje kode z gostiteljem Azure. Če ima tvoja aplikacija tako front-end kot API, boš imel dve storitvi.

### `infra/` — tvoji Azure viri kot koda

Mapa `infra/` vsebuje Bicep datoteke, ki definirajo Azure vire, ki jih tvoja aplikacija potrebuje (App Service, baza podatkov itd.). Ni jih treba pisati ročno — azd ustvari delujočo začetno točko. Kasneje jih *lahko* urejaš za dodajanje virov ali izboljšanje varnosti (obe temi sta obravnavani v [Poglavju 4](../chapter-04-infrastructure/README.md)).

> **Namig:** Želiš videti ali prilagoditi ustvarjeno infrastrukturo pred nameščanjem? Zaženi `azd infra generate` (na voljo tudi kot `azd infra synth`), da zapišeš IaC na disk, da jo lahko pregledaš in upravljaš različice.

---

## Korak 3: Nastavi zahtevano konfiguracijo

Če tvoja aplikacija potrebuje nastavitve ali skrivnosti (npr. povezovalno vrstico, API ključ), jih ne zapisuj neposredno v kodo. Uporabi vrednosti okolja:

```bash
# Ustvari okolje
azd env new dev

# Nastavi vrednost, ki ni skrivnost
azd env set API_VERSION 1.0.0
```

Prave skrivnosti shranjuj v Key Vault in jih na infrastrukturo sklicuj – glej [Poglavje 3: Konfiguracija in avtentikacija](../chapter-03-configuration/authsecurity.md).

---

## Korak 4: Namesti

Uporabi tok dela, ki ga že poznaš:

```bash
# Avtentikacija (zahtevano za azd)
azd auth login

# Predogled virov, ki bodo ustvarjeni
azd provision --preview

# Pripravite infrastrukturo in namestite svojo kodo
azd up
```

Ko konča, azd prikaže URL tvoje aplikacije. Preveri jo na enak način kot katero koli azd aplikacijo:

```bash
azd show           # pokaži končne točke
azd monitor --logs # preveri dnevnike, če je potrebno
```

---

## Pogoste začetne težave

| Simptom | Verjetni vzrok | Popravek |
|---------|--------------|-----|
| azd ni zaznal moje aplikacije | Manjkajoč manifest (npr. `package.json`) | Dodaj manifest ali ročno izberi gostitelja med `azd init` |
| Gradnja spodleti med `azd up` | Aplikacija potrebuje gradbeni korak | Dodaj `buildCommand`/`outputPath` pod storitev v `azure.yaml` |
| Aplikacija se zažene, vendar vrača napake | Manjkajoča konfiguracija/skrivnost | Nastavi vrednosti z `azd env set` ali poveži Key Vault |
| Izbran napačen gostitelj | Samodejna zaznava je ugibala | Uredi `host:` v `azure.yaml` in ponovno zaženi `azd up` |

Za več informacij glej [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md).

---

## Čiščenje

```bash
azd down --force --purge
```

---

## Povzetek

- `azd init` → **"Uporabi kodo v trenutnem imeniku"** doda azd k aplikaciji, ki jo že imaš.
- `azure.yaml` preslika tvoje mape kode na gostitelje Azure; `infra/` definira vire kot Bicep.
- `azd infra generate` ti omogoči pregled ali prilagoditev ustvarjene infrastrukture.
- Ko je inicializirana, tvoja obstoječa aplikacija uporablja popolnoma isti tok dela `azd up` / `azd down` kot aplikacija na osnovi predloge.

---

## 🔗 Navigacija

| Smer | Lekcija |
|-----------|--------|
| **Prejšnje** | [Tvoj prvi projekt](first-project.md) |
| **Naslednje** | [Razvojni kontejnerji in Codespaces](dev-containers.md) |

## 📖 Povezani viri

- [Osnove AZD](azd-basics.md)
- [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/README.md)
- [Konfiguracija in avtentikacija](../chapter-03-configuration/authsecurity.md)
- [Ukazni povzetek](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->