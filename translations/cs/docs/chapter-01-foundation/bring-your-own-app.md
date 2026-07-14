# Přineste svoji vlastní aplikaci - Přidání azd do existujícího projektu

**Navigace kapitolou:**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 1 - Základy a rychlý start
- **⬅️ Předchozí**: [Váš první projekt](first-project.md)
- **➡️ Další**: [Vývojářské kontejnery a Codespaces](dev-containers.md)

> Ověřeno na `azd 1.27.1` v červenci 2026.

## Úvod

V [Vašem prvním projektu](first-project.md) jste nasadili aplikaci začínajíc od šablony. Ale většinou už aplikaci *máte* — Node.js API, Python Flask službu, .NET webovou aplikaci — umístěnou ve složce na vašem počítači. Tato lekce ukazuje, jak přidat azd k tomuto existujícímu kódu, abyste ji mohli nasadit pomocí `azd up`, bez potřeby šablony.

## Cíle učení

Po dokončení této lekce budete:
- Rozumět třem způsobům, jak začít projekt azd
- Spustit `azd init` v rámci existujícího kódu
- Chápat, co dělá `azure.yaml` a složka `infra/` pro vaši aplikaci
- Vědět, kdy nechat azd generovat infrastrukturu a kdy si napsat vlastní
- Nasadit svoji existující aplikaci do Azure s `azd up`

## Výstupy učení

Po dokončení této lekce budete schopni:
- Inicializovat azd v projektu, který už máte
- Číst a upravovat základní soubor `azure.yaml`
- Generovat výchozí infrastrukturu pomocí `azd infra generate`
- Vybrat vhodného hostitele Azure pro vaši aplikaci
- Nasadit a vyčistit svou vlastní aplikaci

---

## Tři způsoby, jak začít projekt azd

| Výchozí bod | Příkaz | Kdy použít |
|----------------|---------|-------------|
| **Ze šablony** | `azd init --template <name>` | Učení, nebo začátek nové aplikace ze ověřeného vzoru |
| **Ze stávajícího kódu** | `azd init` (ve složce projektu) | Už máte aplikaci a chcete ji nasadit |
| **Ze Git repozitáře** | `azd init --from-code` (v naklonovaném repozitáři) | Převzetí azd pro existující repozitář |

Už jste si vyzkoušeli první možnost. Tato lekce pokrývá druhou – nejběžnější scénář v reálném světě.

---

## Krok 1: Spusťte `azd init` ve svém projektu

Otevřete terminál **uvnitř složky vašeho existujícího projektu** a spusťte:

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

Zvolte **"Použít kód v aktuálním adresáři."** azd potom prohledá vaši složku, zjistí jazyk a framework a navrhne hostitele.

### Co azd detekuje

azd hledá signály jako `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, nebo `Dockerfile` a navrhuje odpovídající hostitele v Azure:

| Vaše aplikace | Pravděpodobný detekovaný hostitel |
|----------|----------------------|
| Node.js / Python / .NET webová aplikace | Azure App Service nebo Container Apps |
| Aplikace v kontejneru (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Statická stránka (výstup build React/Vue) | Azure Static Web Apps |

Potvrďte detekovanou službu/služby a azd vytvoří potřebné soubory.

---

## Krok 2: Pochopte, co azd vytvořil

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

Toto je srdcem projektu azd. Minimální soubor vypadá takto:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je klíčový: každý záznam mapuje složku vašeho kódu na hostitele v Azure. Pokud vaše aplikace má frontend i API, budete mít dvě služby.

### `infra/` — vaše Azure prostředky jako kód

Složka `infra/` obsahuje Bicep soubory, které definují Azure prostředky, jež vaše aplikace potřebuje (App Service, databáze atd.). Nemusíte je psát ručně — azd vygeneruje funkční výchozí bod. Můžete je *později* upravit, přidat prostředky nebo zpřísnit zabezpečení (viz [Kapitola 4](../chapter-04-infrastructure/README.md)).

> **Tip:** Chcete zobrazit nebo přizpůsobit generovanou infrastrukturu před nasazením? Spusťte `azd infra generate` (také dostupné jako `azd infra synth`), abyste si IaC uložili na disk a mohli ji zkontrolovat nebo verzovat.

---

## Krok 3: Nastavte požadovanou konfiguraci

Pokud vaše aplikace potřebuje nastavení nebo tajemství (připojovací řetězec, API klíč), neukládejte je přímo do kódu. Použijte hodnoty prostředí:

```bash
# Vytvořit prostředí
azd env new dev

# Nastavit nezabezpečenou hodnotu
azd env set API_VERSION 1.0.0
```

Pro skutečná tajemství je ukládejte do Key Vault a odkazujte na ně z infrastruktury — viz [Kapitola 3: Konfigurace a ověřování](../chapter-03-configuration/authsecurity.md).

---

## Krok 4: Nasazení

Nyní použijte známý pracovní postup:

```bash
# Ověření (vyžadováno pro azd)
azd auth login

# Náhled zdrojů, které budou vytvořeny
azd provision --preview

# Zajistěte infrastrukturu a nasaďte svůj kód
azd up
```

Po dokončení azd vytiskne URL vaší aplikace. Ověřte ji stejným způsobem jako u jakékoli aplikace azd:

```bash
azd show           # zobrazit koncové body
azd monitor --logs # v případě potřeby zkontrolujte protokoly
```

---

## Běžné problémy při prvním spuštění

| Příznak | Pravděpodobná příčina | Řešení |
|---------|--------------|-----|
| azd nedetekoval moji aplikaci | Chybějící manifest (např. `package.json`) | Přidejte manifest, nebo vyberte hostitele ručně během `azd init` |
| Selhání build při `azd up` | Aplikace vyžaduje build krok | Přidejte `buildCommand`/`outputPath` pod službu v `azure.yaml` |
| Aplikace startuje, ale vrací chyby | Chybějící konfigurace/tajemství | Nastavte hodnoty s `azd env set` nebo připojte Key Vault |
| Vybraný hostitel je nesprávný | Automatická detekce se spletla | Upravte `host:` v `azure.yaml` a znovu spusťte `azd up` |

Pro více informací viz [Kapitola 7: Řešení problémů](../chapter-07-troubleshooting/README.md).

---

## Úklid

```bash
azd down --force --purge
```

---

## Shrnutí

- `azd init` → **"Použít kód v aktuálním adresáři"** přidá azd k aplikaci, kterou už máte.
- `azure.yaml` mapuje složky vašeho kódu na hostitele Azure; `infra/` definuje prostředky pomocí Bicep.
- `azd infra generate` vám umožní zkontrolovat nebo přizpůsobit vygenerovanou infrastrukturu.
- Jakmile je inicializováno, vaše existující aplikace používá úplně stejný pracovní postup `azd up` / `azd down` jako aplikace založené na šabloně.

---

## 🔗 Navigace

| Směr | Lekce |
|-----------|--------|
| **Předchozí** | [Váš první projekt](first-project.md) |
| **Další** | [Vývojářské kontejnery a Codespaces](dev-containers.md) |

## 📖 Související zdroje

- [Základy AZD](azd-basics.md)
- [Kapitola 4: Infrastruktura jako kód](../chapter-04-infrastructure/README.md)
- [Konfigurace a ověřování](../chapter-03-configuration/authsecurity.md)
- [Cheat Sheet příkazů](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->