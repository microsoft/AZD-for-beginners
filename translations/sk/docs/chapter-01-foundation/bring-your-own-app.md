# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Overené s `azd 1.25.6` v júni 2026.

## Introduction

V [Your First Project](first-project.md) ste nasadili aplikáciu tak, že ste začali zo šablóny. Väčšinou však už aplikáciu máte — Node.js API, Python Flask službu, .NET webovú aplikáciu — vo foldri na vašom počítači. Táto lekcia ukazuje, ako pridať azd k existujúcemu kódu, aby ste ho mohli nasadiť pomocou `azd up`, bez potreby šablóny.

## Learning Goals

Na konci tejto lekcie budete:
- Rozumieť trom spôsobom, ako začať projekt azd
- Spustiť `azd init` v existujúcom kóde
- Rozumieť, čo robí `azure.yaml` a priečinok `infra/` pre vašu aplikáciu
- Vedieť, kedy nechať azd vygenerovať infraštruktúru vs. kedy ju napísať sami
- Nasadiť svoju existujúcu aplikáciu do Azure pomocou `azd up`

## Learning Outcomes

Po dokončení tejto lekcie budete vedieť:
- Inicializovať azd v projekte, ktorý už máte
- Čítať a upravovať základný súbor `azure.yaml`
- Generovať počiatočnú infraštruktúru pomocou `azd infra generate`
- Vybrať vhodný Azure host pre vašu aplikáciu
- Nasadiť a vyčistiť vlastnú aplikáciu

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Na učenie sa alebo pri štarte novej aplikácie zo overeného príkladu |
| **From your existing code** | `azd init` (in your project folder) | Už máte aplikáciu a chcete ju nasadiť |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Zavádzanie azd do existujúceho repozitára |

Už ste si vyskúšali prvú možnosť. Táto lekcia pokrýva druhú — najbežnejší reálny scenár.

---

## Step 1: Run `azd init` in Your Project

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vyberte **"Use code in the current directory."** azd potom prehľadá váš priečinok, zistí váš jazyk a framework a navrhne hostiteľa.

### What azd detects

azd hľadá signály ako `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, alebo `Dockerfile` a navrhne zodpovedajúci Azure host:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Potvrďte zistené služby a azd vygeneruje súbory, ktoré potrebujete.

---

## Step 2: Understand What azd Created

After init, you'll have two new things in your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — the project definition

Toto je jadro projektu azd. Minimálny súbor vyzerá takto:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je kľúčová časť: každá položka mapuje priečinok vášho kódu na Azure hostiteľa. Ak má vaša aplikácia frontend aj API, budete mať dve služby.

### `infra/` — your Azure resources as code

Priečinok `infra/` obsahuje Bicep súbory, ktoré definujú Azure zdroje, ktoré vaša aplikácia potrebuje (App Service, databázu atď.). Nemusíte ich písať ručne — azd vygeneruje funkčný východiskový bod. Neskôr ich môžete upraviť, aby ste pridali zdroje alebo sprísnili zabezpečenie (pokryté v [Chapter 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Chcete vidieť alebo prispôsobiť vygenerovanú infraštruktúru pred nasadením? Spustite `azd infra generate` (tiež dostupné ako `azd infra synth`), aby sa IaC zapísalo na disk, môžete ho skontrolovať a verzovať.

---

## Step 3: Set Required Configuration

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# Vytvorte prostredie
azd env new dev

# Nastavte netajnú hodnotu
azd env set API_VERSION 1.0.0
```

Pre skutočné tajomstvá uložte hodnoty do Key Vault a odkazujte na ne z vašej infraštruktúry — pozrite [Chapter 3: Configuration & Authentication](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# Autentifikácia (vyžaduje sa pre azd)
azd auth login

# Náhľad zdrojov, ktoré budú vytvorené
azd provision --preview

# Poskytnutie infraštruktúry a nasadenie vášho kódu
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # zobraziť koncové body
azd monitor --logs # skontrolovať záznamy podľa potreby
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Pridajte manifest alebo počas `azd init` vyberte hostiteľa manuálne |
| Build fails during `azd up` | App needs a build step | Pridajte `buildCommand`/`outputPath` pod službu v `azure.yaml` |
| App starts but returns errors | Missing config/secret | Nastavte hodnoty pomocou `azd env set` alebo prepojte Key Vault |
| Wrong host chosen | Auto-detection guessed | Upravte `host:` v `azure.yaml` a znova spustite `azd up` |

Pre viac informácií pozrite [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** pridá azd k aplikácii, ktorú už máte.
- `azure.yaml` mapuje priečinky kódu na Azure hostiteľov; `infra/` definuje zdroje ako Bicep.
- `azd infra generate` vám umožní skontrolovať alebo prispôsobiť vygenerovanú infraštruktúru.
- Po inicializácii vaša existujúca aplikácia používa presne rovnaký pracovný tok `azd up` / `azd down` ako aplikácia založená na šablóne.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Your First Project](first-project.md) |
| **Next** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Related Resources

- [AZD Basics](azd-basics.md)
- [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentication](../chapter-03-configuration/authsecurity.md)
- [Command Cheat Sheet](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->