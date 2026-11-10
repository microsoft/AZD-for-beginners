# Přineste si vlastní aplikaci - Přidání azd do existujícího projektu

**Navigace v kapitole:**
- **📚 Domů ke kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Váš první projekt](first-project.md)
- **➡️ Další**: [Dev kontejnery a Codespaces](dev-containers.md)

> Cíl revize příkazů a konfigurace: `azd 1.37.2` (listopad 2026). Generované soubory závisí na zjištěné aplikaci; Azure nasazení nebylo při této revizi provedeno.

## Úvod

V [Vašem prvním projektu](first-project.md) jste nasadili aplikaci začínající ze šablony. Ale většinou už *máte* aplikaci – Node.js API, Python Flask službu, .NET webovou aplikaci – ležící ve složce na vašem stroji. Tato lekce ukazuje, jak přidat azd k tomuto existujícímu kódu, abyste jej mohli nasadit s `azd up`, bez potřeby šablony.

## Cíle učení

Na konci této lekce budete:
- Rozumět třem způsobům, jak zahájit projekt azd
- Spustit `azd init` uvnitř existujícího kódu
- Pochopit, co `azure.yaml` a složka `infra/` znamenají pro vaši aplikaci
- Vědět, kdy nechat azd generovat infrastrukturu a kdy psát vlastní
- Nasadit vaši existující aplikaci do Azure pomocí `azd up`

## Výsledky učení

Po dokončení této lekce budete schopni:
- Inicializovat azd v projektu, který už vlastníte
- Číst a upravovat základní soubor `azure.yaml`
- Generovat startovací infrastrukturu za pomocí `azd infra generate`
- Vybrat vhodný Azure host pro vaši aplikaci
- Nasadit a vyčistit vaši vlastní aplikaci

---

## Tři způsoby, jak zahájit projekt azd

| Výchozí bod | Příkaz | Kdy použít |
|------------|--------|------------|
| **Ze šablony** | `azd init --template <name> .` (prázdný adresář) | Učení se, nebo zahájení nové aplikace z ověřeného vzoru |
| **Z vašeho existujícího kódu** | `azd init` (ve vaší projektové složce) | Už máte aplikaci a chcete ji nasadit |
| **Z Git repozitáře** | `azd init --from-code` (v naklonovaném repozitáři) | Přijetí azd pro existující repozitář |

Už jste procvičili první možnost. Tato lekce pokrývá druhou – nejnadanější scénář v reálném světě.

---

## Krok 1: Spusťte `azd init` ve vašem projektu

Otevřete terminál **v rámci vaší existující projektové složky** a spusťte:

```bash
cd my-existing-app
azd init
```

azd se zeptá, jak chcete inicializovat. Vyberte:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Zvolte **"Použít kód v aktuálním adresáři."** azd poté prohledá vaši složku, detekuje jazyk a framework a navrhne hostitele.

### Co azd detekuje

azd hledá indicie aplikace, jako jsou `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` nebo `Dockerfile`. Průběh z kódu není obecný průvodce výběrem hostitele pro každý podporovaný cíl nasazení:

| Vaše aplikace | Pravděpodobně detekovaný hostitel |
|--------------|------------------------------|
| Podporovaná Node.js / Python / .NET webová aplikace | Obvykle Azure Container Apps; zkontrolujte generovanou definici |
| Kontejnerová aplikace (`Dockerfile`) | Azure Container Apps |
| Funkční aplikace nebo projekt Static Web Apps | Použijte odpovídající šablonu nebo vytvořte `azure.yaml` a infrastrukturu, pokud průběh z kódu nepodporuje vaši strukturu |

Potvrďte zjištěné služby, a azd vytvoří potřebné soubory.

---

## Krok 2: Pochopte, co azd vytvořil

Po inicializaci zkontrolujte `azure.yaml`. Průběh generované infrastruktury může zůstat implicitní, dokud nespustíte `azd infra generate`; nepředpokládejte, že `infra/` již existuje:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definice projektu

Toto je srdce projektu azd. Následující **ilustrativní definice App Service** vyžaduje odpovídající infrastrukturu App Service; není důvod měnit generovaného hostitele Container Apps bez změny infrastruktury:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je klíčovou částí: každý záznam mapuje složku vašeho kódu na Azure hostitele. Pokud má vaše aplikace frontend i API, budete mít dvě služby.

### `infra/` — vaše Azure zdroje jako kód

Složka `infra/` obsahuje Bicep soubory, které definují Azure zdroje, které vaše aplikace potřebuje (App Service, databázi atd.). Nemusíte je psát ručně — azd generuje funkční výchozí bod. Můžete je *později* upravovat k přidání zdrojů nebo zpřísnění bezpečnosti (pokryto v [Kapitole 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Chcete vidět nebo přizpůsobit generovanou infrastrukturu před nasazením? Spusťte `azd infra generate` (také dostupné jako `azd infra synth`) k zápisu IaC na disk pro kontrolu a verzování.

---

## Krok 3: Nastavte požadovanou konfiguraci

Pokud vaše aplikace potřebuje nastavení nebo tajemství (připojovací řetězec, API klíč), nehardcodeujte je. Použijte hodnoty prostředí:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Toto uloží hodnotu pouze lokálně. Aby to mělo efekt na aplikaci, musíte ji explicitně použít v parametrech infrastruktury, podporovaném nastavení služby nebo háčku; nastavení libovolné proměnné samo o sobě nemění konfiguraci běhového prostředí.

Pro skutečná tajemství je ukládejte v Key Vault a referencujte je z infrastruktury – viz [Kapitola 3: Konfigurace & Autentizace](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Nasadit

Teď použijte stejný postup, který už znáte:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Po dokončení azd vytiskne URL vaší aplikace. Ověřte ji stejně jako jakoukoli azd aplikaci:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Běžné problémy při prvním spuštění

| Symptomy | Pravděpodobná příčina | Řešení |
|----------|-----------------------|---------|
| azd nedetekoval mou aplikaci | Chybějící manifest (např. `package.json`) | Přidejte manifest nebo zvolte hostitele ručně při `azd init` |
| Stavba selže během `azd up` | Aplikace potřebuje krok sestavení | Nakonfigurujte skripty balíčku aplikace nebo háček služby `prepackage`; použijte `dist` pro výstup nasazení, ne `buildCommand`/`outputPath` |
| Aplikace startuje, ale vrací chyby | Chybějící nastavení/tajemství | Zapojte hodnoty do nastavení běhové aplikace nebo referencujte Key Vault; jen `azd env set` nestačí |
| Vybrán nesprávný hostitel | Automatická detekce neodpovídá vašim potřebám | Změňte `host:` i odpovídající infrastrukturu, nebo vyberte vhodnou šablonu |

Pro více viz [Kapitola 7: Odstraňování problémů](../chapter-07-troubleshooting/README.md).

---

## Vyčištění

```bash
azd down --force --purge
```

---

## Shrnutí

- `azd init` → **"Použít kód v aktuálním adresáři"** přidá azd k aplikaci, kterou už máte.
- `azure.yaml` mapuje vaše složky kódu na Azure hostitele; `infra/` definuje zdroje jako Bicep.
- `azd infra generate` vám umožní zkontrolovat nebo přizpůsobit generovanou infrastrukturu.
- Po inicializaci vaše existující aplikace používá stejný `azd up` / `azd down` postup jako aplikace založená na šabloně.

---

## 🔗 Navigace

| Směr | Lekce |
|-------|--------|
| **Předchozí** | [Váš první projekt](first-project.md) |
| **Další** | [Dev kontejnery a Codespaces](dev-containers.md) |

## 📖 Související zdroje

- [Základy AZD](azd-basics.md)
- [Kapitola 4: Infrastruktura jako kód](../chapter-04-infrastructure/README.md)
- [Konfigurace & Autentizace](../chapter-03-configuration/authsecurity.md)
- [Přehled příkazů](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->