# Bring Your Own App - Add azd to an Existing Project

**Chapter Navigation:**
- **📚 Course Home**: [AZD pro začátečníky](../../README.md)
- **📖 Current Chapter**: Kapitola 1 - Základy & Rychlý start
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Dev Containers & Codespaces](dev-containers.md)

> Ověřeno proti `azd 1.25.6` v červnu 2026.

## Úvod

V [Your First Project](first-project.md) jste nasadili aplikaci začínající ze šablony. Ale většinu času už aplikaci *máte* — Node.js API, Python Flask službu, .NET webovou aplikaci — ležící ve složce na vašem počítači. Tato lekce ukazuje, jak do existujícího kódu přidat azd, abyste ji mohli nasadit pomocí `azd up`, bez potřeby šablony.

## Cíle lekce

Na konci této lekce:
- Porozumíte třem způsobům, jak zahájit projekt azd
- Spustíte `azd init` v existujícím kódu
- Porozumíte, co dělají `azure.yaml` a složka `infra/` pro vaši aplikaci
- Budete vědět, kdy nechat azd vygenerovat infrastrukturu a kdy psát vlastní
- Nasadíte svou existující aplikaci do Azure pomocí `azd up`

## Očekávané výsledky

Po dokončení této lekce budete schopni:
- Inicializovat azd v projektu, který už máte
- Číst a upravovat základní soubor `azure.yaml`
- Vygenerovat startovní infrastrukturu pomocí `azd infra generate`
- Vybrat vhodný Azure host pro vaši aplikaci
- Nasadit a odstranit vlastní aplikaci

---

## Tři způsoby, jak zahájit projekt azd

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Učení nebo zahájení nové aplikace z ověřeného vzoru |
| **From your existing code** | `azd init` (in your project folder) | Už máte aplikaci a chcete ji nasadit |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Zavádění azd do existujícího repozitáře |

Už jste si procvičili první možnost. Tato lekce pokrývá druhou — nejběžnější scénář v reálném světě.

---

## Krok 1: Spusťte `azd init` ve svém projektu

Otevřete terminál **ve vaší existující složce projektu** a spusťte:

```bash
cd my-existing-app
azd init
```

azd se zeptá, jak chcete inicializovat. Zvolte:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Vyberte **"Use code in the current directory."** azd poté prohledá vaši složku, zjistí jazyk a framework a navrhne hostitele.

### Co azd detekuje

azd hledá signály jako `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` nebo `Dockerfile` a navrhuje odpovídající Azure hostitele:

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service nebo Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Potvrďte zjištěné služby a azd vygeneruje potřebné soubory.

---

## Krok 2: Porozumějte tomu, co azd vytvořil

Po inicializaci budete mít ve svém projektu dvě nové věci:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definice projektu

To je srdce projektu azd. Minimální podoba vypadá takto:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je klíčová část: každý záznam mapuje složku vašeho kódu na Azure hostitele. Pokud má vaše aplikace frontend i API, budete mít dvě služby.

### `infra/` — vaše Azure prostředky jako kód

Složka `infra/` obsahuje Bicep soubory, které definují Azure prostředky, které vaše aplikace potřebuje (App Service, databázi atd.). Nemusíte je psát ručně — azd vygeneruje funkční výchozí bod. Můžete je později upravit, přidat prostředky nebo zpřísnit zabezpečení (pokryto v [Kapitole 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Chcete vidět nebo přizpůsobit vygenerovanou infrastrukturu před nasazením? Spusťte `azd infra generate` (dostupné také jako `azd infra synth`), aby se IaC zapsalo na disk a mohli jste to zkontrolovat a verzovat.

---

## Krok 3: Nastavte požadovanou konfiguraci

Pokud vaše aplikace potřebuje nastavení nebo tajemství (connection string, API klíč), neukládejte je napevno. Použijte hodnoty prostředí:

```bash
# Vytvořit prostředí
azd env new dev

# Nastavit hodnotu, která není tajná
azd env set API_VERSION 1.0.0
```

Pro skutečná tajemství je ukládejte v Key Vault a odkazujte na ně ze své infrastruktury — viz [Kapitola 3: Konfigurace & Autentizace](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Nasazení

Nyní použijte stejný pracovní postup, který už znáte:

```bash
# Ověření (vyžadováno pro azd)
azd auth login

# Náhled prostředků, které budou vytvořeny
azd provision --preview

# Zajistit infrastrukturu a nasadit váš kód
azd up
```

Po dokončení azd zobrazí URL vaší aplikace. Ověřte ji stejným způsobem jako u kterékoliv azd aplikace:

```bash
azd show           # zobrazit koncové body
azd monitor --logs # zkontrolujte logy, pokud je to potřeba
```

---

## Běžné první problémy

| Příznak | Pravděpodobná příčina | Oprava |
|---------|--------------|-----|
| azd neidentifikoval mou aplikaci | Chybějící manifest (např. `package.json`) | Přidejte manifest nebo vyberte hostitele ručně během `azd init` |
| Sestavení selže během `azd up` | Aplikace potřebuje krok sestavení | Přidejte `buildCommand`/`outputPath` pod službu v `azure.yaml` |
| Aplikace se spustí, ale vrací chyby | Chybějící konfigurace/tajemství | Nastavte hodnoty pomocí `azd env set` nebo propojte Key Vault |
| Vybrán nesprávný hostitel | Chybná automatická detekce | Upravte `host:` v `azure.yaml` a znovu spusťte `azd up` |

Pro více informací viz [Kapitola 7: Řešení problémů](../chapter-07-troubleshooting/README.md).

---

## Vyčištění

```bash
azd down --force --purge
```

---

## Shrnutí

- `azd init` → **"Use code in the current directory"** přidá azd do aplikace, kterou už máte.
- `azure.yaml` mapuje složky kódu na Azure hostitele; `infra/` definuje prostředky jako Bicep.
- `azd infra generate` vám umožní zkontrolovat nebo přizpůsobit vygenerovanou infrastrukturu.
- Jakmile je inicializováno, vaše existující aplikace používá stejný pracovní postup `azd up` / `azd down` jako aplikace založená na šabloně.

---

## 🔗 Navigace

| Směr | Lekce |
|-----------|--------|
| **Předchozí** | [Your First Project](first-project.md) |
| **Další** | [Dev Containers & Codespaces](dev-containers.md) |

## 📖 Související zdroje

- [AZD Basics](azd-basics.md)
- [Kapitola 4: Infrastruktura jako kód](../chapter-04-infrastructure/README.md)
- [Konfigurace & Autentizace](../chapter-03-configuration/authsecurity.md)
- [Přehled příkazů](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->