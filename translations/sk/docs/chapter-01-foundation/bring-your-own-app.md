# Prineste si svoju aplikáciu - Pridajte azd do existujúceho projektu

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a Rýchly štart
- **⬅️ Predchádzajúca**: [Váš prvý projekt](first-project.md)
- **➡️ Nasledujúca**: [Vývojové kontajnery a Codespaces](dev-containers.md)

> Overené s `azd 1.27.1` v júli 2026.

## Úvod

V [Vašom prvom projekte](first-project.md) ste nasadili aplikáciu začatím z šablóny. Ale väčšinou už aplikáciu *máte* — Node.js API, Python Flask službu, .NET webovú aplikáciu — ktorá je uložená v priečinku na vašom počítači. Táto lekcia ukazuje, ako pridať azd do tohto existujúceho kódu, aby ste ho mohli nasadiť pomocou `azd up`, bez potreby šablóny.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť trom spôsobom, ako začať projekt azd
- Spustiť `azd init` vo vnútri existujúcej kódbázy
- Rozumieť, čo robí súbor `azure.yaml` a priečinok `infra/` pre vašu aplikáciu
- Vedieť, kedy nechať azd generovať infraštruktúru a kedy písať vlastnú
- Nasadiť vašu existujúcu aplikáciu do Azure pomocou `azd up`

## Výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Inicializovať azd v projekte, ktorý už máte
- Čítať a upravovať základný súbor `azure.yaml`
- Generovať počiatočnú infraštruktúru pomocou `azd infra generate`
- Vybrať vhodný hostiteľ Azure pre vašu aplikáciu
- Nasadiť a vyčistiť vlastnú aplikáciu

---

## Tri spôsoby, ako začať projekt azd

| Východiskový bod | Príkaz | Kedy použiť |
|----------------|---------|-------------|
| **Zo šablóny** | `azd init --template <name>` | Učenie sa alebo začatie novej aplikácie zo overeného príkladu |
| **Z existujúceho kódu** | `azd init` (vo vašom projektovom priečinku) | Už máte aplikáciu a chcete ju nasadiť |
| **Z Git repozitára** | `azd init --from-code` (v sklonovanom repozitári) | Prijať azd pre existujúce úložisko |

Už ste si vyskúšali prvú možnosť. Táto lekcia sa venuje druhej — najbežnejšiemu reálnemu scenáru.

---

## Krok 1: Spustite `azd init` vo vašom projekte

Otvorte terminál **vo vnútri vášho existujúceho projektového priečinka** a spustite:

```bash
cd my-existing-app
azd init
```

azd sa spýta, ako chcete inicializovať. Vyberte:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vyberte **"Použiť kód v aktuálnom priečinku."** azd potom prehľadá váš priečinok, zistí váš jazyk a framework a navrhne hostiteľa.

### Čo azd zistí

azd hľadá signály ako `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` alebo `Dockerfile` a navrhuje zodpovedajúceho hostiteľa Azure:

| Vaša aplikácia | Pravdepodobný zistený hostiteľ |
|----------|----------------------|
| Node.js / Python / .NET webová aplikácia | Azure App Service alebo Container Apps |
| Kontajnerizovaná aplikácia (`Dockerfile`) | Azure Container Apps |
| Funkčná aplikácia | Azure Functions |
| Statická stránka (výstup zo stavby React/Vue) | Azure Static Web Apps |

Potvrďte zistené služby a azd vytvorí potrebné súbory.

---

## Krok 2: Pochopte, čo azd vytvoril

Po inicializácii budete mať v projekte dve nové veci:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definícia projektu

Toto je srdce projektu azd. Minimálna verzia vyzerá takto:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je kľúčovou časťou: každá položka mapuje priečinok vášho kódu na hostiteľa Azure. Ak má vaša aplikácia front-end aj API, budete mať dve služby.

### `infra/` — vaše Azure zdroje ako kód

Priečinok `infra/` obsahuje súbory Bicep, ktoré definujú Azure zdroje, ktoré vaša aplikácia potrebuje (App Service, databázu, atď.). Nemusíte ich písať ručne — azd generuje funkčný počiatočný bod. Neskôr ich *môžete* upravovať na pridanie zdrojov alebo zvýšenie bezpečnosti (popísané v [kapitole 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Chcete vidieť alebo prispôsobiť generovanú infraštruktúru pred nasadením? Spustite `azd infra generate` (takisto dostupné ako `azd infra synth`), aby ste zapísali IaC na disk, kde ju môžete skontrolovať a verzovať.

---

## Krok 3: Nastavte požadovanú konfiguráciu

Ak vaša aplikácia potrebuje nastavenia alebo tajomstvá (pripojovací reťazec, API kľúč), neukladajte ich natvrdo do kódu. Používajte hodnoty prostredia:

```bash
# Vytvorte prostredie
azd env new dev

# Nastavte hodnotu, ktorá nie je tajná
azd env set API_VERSION 1.0.0
```

Pre skutočné tajomstvá ich ukladáte do Key Vault a odkazujete ich vo vašej infraštruktúre — pozrite [kapitolu 3: Konfigurácia a autenfikácia](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Nasadenie

Teraz použite ten istý pracovný tok, ktorý už poznáte:

```bash
# Overiť (vyžaduje sa pre azd)
azd auth login

# Náhľad prostriedkov, ktoré budú vytvorené
azd provision --preview

# Zabezpečiť infraštruktúru a nasadiť váš kód
azd up
```

Po dokončení azd zobrazí URL vašej aplikácie. Overte ju rovnakým spôsobom ako ktorúkoľvek aplikáciu azd:

```bash
azd show           # zobraziť koncové body
azd monitor --logs # skontrolovať protokoly, ak je to potrebné
```

---

## Bežné prvé problémy

| Symptóm | Pravdepodobná príčina | Riešenie |
|---------|--------------|-----|
| azd nezistil moju aplikáciu | Chýbajúci manifest (napr. `package.json`) | Pridajte manifest alebo ručne vyberte hostiteľa počas `azd init` |
| Zlyhanie kompilačného kroku počas `azd up` | Aplikácia potrebuje krok zostavenia | Pridajte `buildCommand`/`outputPath` pod službou v `azure.yaml` |
| Aplikácia sa spustí, ale vracia chyby | Chýbajúca konfigurácia/tajomstvo | Nastavte hodnoty pomocou `azd env set` alebo prepojte Key Vault |
| Vybraný nesprávny hostiteľ | Autodetekcia uhádla | Upraviť `host:` v `azure.yaml` a znova spustiť `azd up` |

Pre viac informácií pozrite [kapitolu 7: Riešenie problémov](../chapter-07-troubleshooting/README.md).

---

## Vyčistenie

```bash
azd down --force --purge
```

---

## Zhrnutie

- `azd init` → **"Použiť kód v aktuálnom priečinku"** pridá azd k aplikácii, ktorú už máte.
- `azure.yaml` mapuje priečinky vášho kódu na Azure hostiteľov; `infra/` definuje zdroje pomocou Bicep.
- `azd infra generate` vám umožňuje prezrieť alebo prispôsobiť generovanú infraštruktúru.
- Po inicializácii vaša existujúca aplikácia používa rovnaký pracovný tok `azd up` / `azd down` ako aplikácia založená na šablóne.

---

## 🔗 Navigácia

| Smer | Lekcia |
|-----------|--------|
| **Predchádzajúca** | [Váš prvý projekt](first-project.md) |
| **Nasledujúca** | [Vývojové kontajnery a Codespaces](dev-containers.md) |

## 📖 Súvisiace zdroje

- [Základy AZD](azd-basics.md)
- [Kapitola 4: Infraštruktúra ako kód](../chapter-04-infrastructure/README.md)
- [Konfigurácia a autentifikácia](../chapter-03-configuration/authsecurity.md)
- [Podrobný príručkový zoznam príkazov](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->