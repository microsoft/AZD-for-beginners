<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:23:57+00:00",
  "source_file": "examples/README.md",
  "language_code": "cs"
}
-->
# Příklady - Praktické šablony a konfigurace AZD

## Úvod

Tento adresář obsahuje praktické příklady, šablony a scénáře z reálného světa, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Každý příklad poskytuje kompletní funkční kód, šablony infrastruktury a podrobné pokyny pro různé architektury aplikací a vzory nasazení.

## Cíle učení

Prací na těchto příkladech si osvojíte:
- Procvičení pracovních postupů Azure Developer CLI s realistickými scénáři aplikací
- Porozumění různým architekturám aplikací a jejich implementacím v azd
- Zvládnutí vzorů Infrastructure as Code pro různé služby Azure
- Použití správy konfigurace a strategií nasazení specifických pro prostředí
- Implementaci monitorování, zabezpečení a škálovacích vzorů v praktických kontextech
- Získání zkušeností s řešením problémů a laděním reálných scénářů nasazení

## Výsledky učení

Po dokončení těchto příkladů budete schopni:
- S jistotou nasazovat různé typy aplikací pomocí Azure Developer CLI
- Přizpůsobit poskytnuté šablony vlastním požadavkům na aplikace
- Navrhovat a implementovat vlastní vzory infrastruktury pomocí Bicep
- Konfigurovat složité aplikace s více službami a správnými závislostmi
- Používat osvědčené postupy pro zabezpečení, monitorování a výkon v reálných scénářích
- Řešit problémy a optimalizovat nasazení na základě praktických zkušeností

## Struktura adresáře

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Příklady pro rychlý start

### Pro začátečníky
1. **[Jednoduchá webová aplikace](../../../examples/simple-web-app)** - Nasazení základní webové aplikace Node.js
2. **[Statická webová stránka](../../../examples/static-website)** - Hostování statické webové stránky na Azure Storage
3. **[Aplikace v kontejneru](../../../examples/container-app)** - Nasazení aplikace v kontejneru

### Pro pokročilé uživatele
4. **[Aplikace s databází](../../../examples/database-app)** - Webová aplikace s databází PostgreSQL
5. **[Serverless funkce](../../../examples/serverless-function)** - Azure Functions s HTTP triggery
6. **[Mikroslužby](../../../examples/microservices)** - Aplikace s více službami a API gateway

## 📋 Pokyny k použití

### Spuštění příkladů lokálně

1. **Naklonujte nebo zkopírujte příklad**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializujte prostředí AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurujte prostředí**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasazení**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Přizpůsobení příkladů

Každý příklad obsahuje:
- **README.md** - Podrobné pokyny k nastavení a přizpůsobení
- **azure.yaml** - Konfigurace AZD s komentáři
- **infra/** - Šablony Bicep s vysvětlením parametrů
- **src/** - Ukázkový kód aplikace
- **scripts/** - Pomocné skripty pro běžné úkoly

## 🎯 Cíle učení

### Kategorie příkladů

#### **Základní nasazení**
- Aplikace s jednou službou
- Jednoduché vzory infrastruktury
- Základní správa konfigurace
- Nákladově efektivní vývojová nastavení

#### **Pokročilé scénáře**
- Architektury s více službami
- Složité konfigurace sítí
- Vzory integrace databází
- Implementace zabezpečení a souladu

#### **Vzory připravené pro produkci**
- Konfigurace vysoké dostupnosti
- Monitorování a pozorovatelnost
- Integrace CI/CD
- Nastavení obnovy po havárii

## 📖 Popisy příkladů

### Jednoduchá webová aplikace
**Technologie**: Node.js, App Service, Application Insights  
**Složitost**: Začátečník  
**Koncepty**: Základní nasazení, proměnné prostředí, kontrola stavu

### Statická webová stránka
**Technologie**: HTML/CSS/JS, Storage Account, CDN  
**Složitost**: Začátečník  
**Koncepty**: Statické hostování, integrace CDN, vlastní domény

### Aplikace v kontejneru
**Technologie**: Docker, Container Apps, Container Registry  
**Složitost**: Středně pokročilý  
**Koncepty**: Kontejnerizace, škálování, konfigurace přístupu

### Aplikace s databází
**Technologie**: Python Flask, PostgreSQL, App Service  
**Složitost**: Středně pokročilý  
**Koncepty**: Připojení k databázi, správa tajemství, migrace

### Serverless funkce
**Technologie**: Azure Functions, Cosmos DB, API Management  
**Složitost**: Středně pokročilý  
**Koncepty**: Architektura řízená událostmi, vazby, správa API

### Mikroslužby
**Technologie**: Více služeb, Service Bus, API Gateway  
**Složitost**: Pokročilý  
**Koncepty**: Komunikace mezi službami, fronty zpráv, vyvažování zátěže

## 🛠 Příklady konfigurace

Adresář `configurations/` obsahuje znovupoužitelné komponenty:

### Konfigurace prostředí
- Nastavení vývojového prostředí
- Konfigurace prostředí pro testování
- Konfigurace připravené pro produkci
- Nastavení nasazení do více regionů

### Moduly Bicep
- Znovupoužitelné komponenty infrastruktury
- Běžné vzory zdrojů
- Šablony se zvýšeným zabezpečením
- Nákladově optimalizované konfigurace

### Pomocné skripty
- Automatizace nastavení prostředí
- Skripty pro migraci databáze
- Nástroje pro ověření nasazení
- Nástroje pro sledování nákladů

## 🔧 Průvodce přizpůsobením

### Přizpůsobení příkladů pro vaše potřeby

1. **Zkontrolujte předpoklady**
   - Ověřte požadavky na služby Azure
   - Zkontrolujte limity předplatného
   - Pochopte nákladové dopady

2. **Upravte konfiguraci**
   - Aktualizujte definice služeb v `azure.yaml`
   - Přizpůsobte šablony Bicep
   - Upravte proměnné prostředí

3. **Důkladně otestujte**
   - Nejprve nasazujte do vývojového prostředí
   - Ověřte funkčnost
   - Testujte škálování a výkon

4. **Zabezpečení**
   - Zkontrolujte přístupová oprávnění
   - Implementujte správu tajemství
   - Aktivujte monitorování a upozornění

## 📊 Porovnávací tabulka

| Příklad | Služby | Databáze | Autentizace | Monitorování | Složitost |
|---------|----------|----------|------|------------|------------|
| Jednoduchá webová aplikace | 1 | ❌ | Základní | Základní | ⭐ |
| Statická webová stránka | 1 | ❌ | ❌ | Základní | ⭐ |
| Aplikace v kontejneru | 1 | ❌ | Základní | Plné | ⭐⭐ |
| Aplikace s databází | 2 | ✅ | Plné | Plné | ⭐⭐⭐ |
| Serverless funkce | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| Mikroslužby | 5+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |

## 🎓 Učební cesta

### Doporučený postup

1. **Začněte s jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte pracovní postup nasazení
   - Procvičte správu prostředí

2. **Vyzkoušejte statickou webovou stránku**
   - Prozkoumejte různé možnosti hostování
   - Naučte se integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na aplikaci v kontejneru**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičte práci s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se zřizování databáze
   - Pochopte připojovací řetězce
   - Procvičte správu tajemství

5. **Prozkoumejte serverless**
   - Pochopte architekturu řízenou událostmi
   - Naučte se o triggerech a vazbách
   - Procvičte práci s API

6. **Vytvořte mikroslužby**
   - Naučte se komunikaci mezi službami
   - Pochopte distribuované systémy
   - Procvičte složitá nasazení

## 🔍 Výběr správného příkladu

### Podle technologického stacku
- **Node.js**: Jednoduchá webová aplikace, Mikroslužby
- **Python**: Aplikace s databází, Serverless funkce
- **Statické stránky**: Statická webová stránka
- **Kontejnery**: Aplikace v kontejneru, Mikroslužby
- **Databáze**: Aplikace s databází, Serverless funkce

### Podle architektonického vzoru
- **Monolitické**: Jednoduchá webová aplikace, Aplikace s databází
- **Statické**: Statická webová stránka
- **Mikroslužby**: Příklad mikroslužeb
- **Serverless**: Serverless funkce
- **Hybridní**: Aplikace v kontejneru

### Podle úrovně složitosti
- **Začátečník**: Jednoduchá webová aplikace, Statická webová stránka
- **Středně pokročilý**: Aplikace v kontejneru, Aplikace s databází, Serverless funkce  
- **Pokročilý**: Mikroslužby

## 📚 Další zdroje

### Odkazy na dokumentaci
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentace Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Příklady z komunity
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### Osvědčené postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Přispívání příkladů

Máte užitečný příklad, který chcete sdílet? Uvítáme vaše příspěvky!

### Pokyny k odeslání
1. Dodržujte zavedenou strukturu adresáře
2. Zahrňte komplexní README.md
3. Přidejte komentáře ke konfiguračním souborům
4. Důkladně otestujte před odesláním
5. Zahrňte odhady nákladů a předpoklady

### Struktura šablony příkladu
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Tip**: Začněte s nejjednodušším příkladem, který odpovídá vašemu technologickému stacku, a postupně se propracovávejte k složitějším scénářům. Každý příklad staví na konceptech z předchozích!

**Další kroky**: 
- Vyberte příklad, který odpovídá vaší úrovni dovedností
- Postupujte podle pokynů k nastavení v README příkladu
- Experimentujte s přizpůsobením
- Sdílejte své poznatky s komunitou

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](../resources/study-guide.md)
- **Zpět na**: [Hlavní README](../README.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o co největší přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Za autoritativní zdroj by měl být považován původní dokument v jeho původním jazyce. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.