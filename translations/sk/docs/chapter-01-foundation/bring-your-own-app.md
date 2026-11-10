# Priveďte si vlastnú aplikáciu - Pridanie azd do existujúceho projektu

**Navigácia Kapitolou:**
- **📚 Domov kurzu**: [AZD Pre Začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 1 - Základy a Rýchly štart
- **⬅️ Predchádzajúca**: [Váš prvý projekt](first-project.md)
- **➡️ Nasledujúca**: [Dev kontajnery a Codespaces](dev-containers.md)

> Cieľová revízia príkazov a konfigurácie: `azd 1.37.2` (november 2026). Generované súbory závisia od zistené aplikácie; Azure rozmiestnenie nebolo vykonané pri tejto revízii.

## Úvod

V [Vašom prvom projekte](first-project.md) ste nasadili aplikáciu začatím z šablóny. Ale väčšinou už *máte* aplikáciu — Node.js API, Python Flask službu, .NET webovú aplikáciu — ktorá sedí v priečinku na vašom počítači. Táto lekcia ukazuje, ako pridať azd k tomu existujúcemu kódu, aby ste ho mohli nasadiť pomocou `azd up`, bez potreby šablóny.

## Ciele učenia

Na konci tejto lekcie budete:
- Rozumieť trom spôsobom, ako začať projekt azd
- Spustiť `azd init` vo vnútri existujúcej kódovej základne
- Rozumieť, čo robí `azure.yaml` a priečinok `infra/` pre vašu aplikáciu
- Vedieť, kedy nechať azd generovať infraštruktúru a kedy napísať vlastnú
- Nasadiť vašu existujúcu aplikáciu do Azure pomocou `azd up`

## Očakávané výsledky učenia

Po dokončení tejto lekcie budete schopní:
- Inicializovať azd v projekte, ktorý už máte
- Čítať a upravovať základný súbor `azure.yaml`
- Generovať štartovaciu infraštruktúru pomocou `azd infra generate`
- Vybrať vhodný Azure host pre vašu aplikáciu
- Nasadiť a vyčistiť vlastnú aplikáciu

---

## Tri spôsoby, ako začať projekt azd

| Štartovací bod | Príkaz | Kedy použiť |
|----------------|---------|-------------|
| **Zo šablóny** | `azd init --template <name> .` (prázdny adresár) | Učenie sa alebo začatie novej aplikácie zo overeného príkladu |
| **Zo svojho existujúceho kódu** | `azd init` (vo vašom projektovom priečinku) | Už máte aplikáciu a chcete ju nasadiť |
| **Z Git repozitára** | `azd init --from-code` (v skopírovanom repozitári) | Prijatie azd pre existujúci repozitár |

Už ste si vyskúšali prvú možnosť. Táto lekcia pokrýva druhú — najbežnejší scenár v reálnom svete.

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

Vyberte **"Použiť kód v aktuálnom priečinku."** azd potom prehľadá váš priečinok, detekuje jazyk a framework a navrhne hostiteľa.

### Čo azd detekuje

azd hľadá signály aplikácie ako napríklad `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, alebo `Dockerfile`. Tok z kódu nie je všeobecným sprievodcom výberu hostiteľa pre každý podporovaný cieľ nasadenia:

| Vaša aplikácia | Pravdepodobne detegovaný hostiteľ |
|----------|----------------------|
| Podporovaná Node.js / Python / .NET webová aplikácia | Typicky Azure Container Apps; pozrite si generovanú definíciu |
| Aplikácia v kontajneri (`Dockerfile`) | Azure Container Apps |
| Funkčná aplikácia alebo projekt Static Web Apps | Použite zodpovedajúcu šablónu alebo vytvorte `azure.yaml` a infraštruktúru, ak tok z kódu nepodporuje vaše usporiadanie |

Potvrďte detegované služby a azd vytvorí súbory, ktoré potrebujete.

---

## Krok 2: Pochopte, čo azd vytvoril

Po inicializácii si prezrite `azure.yaml`. Tok generovanej infraštruktúry môže držať infraštruktúru implicitnú, kým nespustíte `azd infra generate`; nepovažujte `infra/` za už existujúci:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definícia projektu

Toto je jadro projektu azd. Nasledujúca **ilustračná definícia App Service** vyžaduje zodpovedajúcu infraštruktúru App Service; nie je to dôvod na zmenu generovaného hostiteľa Container Apps bez zmeny infraštruktúry:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je kľúčová časť: každá položka mapuje priečinok vášho kódu na Azure hostiteľa. Ak vaša aplikácia má frontend aj API, budete mať dve služby.

### `infra/` — vaše Azure zdroje ako kód

Priečinok `infra/` obsahuje Bicep súbory, ktoré definujú Azure zdroje, ktoré vaša aplikácia potrebuje (App Service, databázu a pod.). Nemusíte ich písať ručne — azd generuje funkčný štartovací bod. Neskôr ich *môžete* upravovať na pridanie zdrojov alebo zvýšenie bezpečnosti (pokrýva [kapitola 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Chcete vidieť alebo prispôsobiť generovanú infraštruktúru pred nasadením? Spustite `azd infra generate` (tiež dostupné ako `azd infra synth`) aby ste zapísali IaC na disk na preskúmanie a verziovanie.

---

## Krok 3: Nastavte požadovanú konfiguráciu

Ak vaša aplikácia potrebuje nastavenia alebo tajomstvá (pripojovací reťazec, API kľúč), nehardkodujte ich. Použite hodnoty z prostredia:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Toto ukladá iba lokálnu hodnotu. Aby to ovplyvnilo aplikáciu, explicitne ju použite v parametroch infraštruktúry, podporovanom nastavení služby alebo hook; nastavenie ľubovoľnej premennej samo osebe nekonfiguruje nasadený runtime.

Pre skutočné tajomstvá ich uložte v Key Vault a odkazujte na ne z vašej infraštruktúry — pozrite [kapitolu 3: Konfigurácia a autentifikácia](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Nasadenie

Teraz použite rovnaký pracovný tok, ktorý už poznáte:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Po dokončení azd vypíše URL vašej aplikácie. Overte ju rovnakým spôsobom ako každú aplikáciu azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Bežné problémy pri prvom použití

| Symptóm | Pravdepodobná príčina | Riešenie |
|---------|--------------|-----|
| azd nezistil moju aplikáciu | Chýba manifest (napr. `package.json`) | Pridajte manifest alebo si počas `azd init` vyberte hostiteľa manuálne |
| Build zlyhá počas `azd up` | Aplikácia potrebuje build krok | Nakonfigurujte skripty balíčkov vašej aplikácie alebo hook služby `prepackage`; použite `dist` na výstup nasadenia, nie `buildCommand`/`outputPath` |
| Aplikácia sa spustí, ale vracia chyby | Chýba konfigurácia/tajomstvo | Zapojte hodnoty do runtime nastavení aplikácie alebo referenciu Key Vault; samotné `azd env set` nestačí |
| Zvolený nesprávny hostiteľ | Automatická detekcia nezodpovedá vašim potrebám | Zmeňte aj `host:` a zodpovedajúcu infraštruktúru, alebo si zvoľte zodpovedajúcu šablónu |

Pre viac informácií pozrite [kapitolu 7: Riešenie problémov](../chapter-07-troubleshooting/README.md).

---

## Vyčistenie

```bash
azd down --force --purge
```

---

## Zhrnutie

- `azd init` → **"Použiť kód v aktuálnom adresári"** pridáva azd k aplikácii, ktorú už máte.
- `azure.yaml` mapuje priečinky vášho kódu na Azure hostiteľov; `infra/` definuje zdroje ako Bicep.
- `azd infra generate` vám umožňuje prezrieť si alebo prispôsobiť generovanú infraštruktúru.
- Po inicializácii vaša existujúca aplikácia používa presne rovnaký pracovný tok `azd up` / `azd down` ako aplikácia založená na šablóne.

---

## 🔗 Navigácia

| Smer | Lekcia |
|-----------|--------|
| **Predchádzajúca** | [Váš prvý projekt](first-project.md) |
| **Nasledujúca** | [Dev kontajnery a Codespaces](dev-containers.md) |

## 📖 Súvisiace zdroje

- [Základy AZD](azd-basics.md)
- [Kapitola 4: Infraštruktúra ako Kód](../chapter-04-infrastructure/README.md)
- [Konfigurácia & Autentifikácia](../chapter-03-configuration/authsecurity.md)
- [Tajná Pomocná tabuľka príkazov](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->