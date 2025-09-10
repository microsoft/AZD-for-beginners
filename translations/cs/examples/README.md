<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-10T06:59:18+00:00",
  "source_file": "examples/README.md",
  "language_code": "cs"
}
-->
# Příklady - Praktické šablony a konfigurace AZD

## Úvod

Tento adresář obsahuje praktické příklady, šablony a reálné scénáře, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Každý příklad poskytuje kompletní funkční kód, šablony infrastruktury a podrobné instrukce pro různé architektury aplikací a vzory nasazení.

## Cíle učení

Prací s těmito příklady se naučíte:
- Procvičit si pracovní postupy Azure Developer CLI na realistických scénářích aplikací
- Pochopit různé architektury aplikací a jejich implementace pomocí azd
- Ovládnout vzory Infrastructure as Code pro různé služby Azure
- Aplikovat strategie správy konfigurace a nasazení specifické pro prostředí
- Implementovat monitorovací, bezpečnostní a škálovací vzory v praktických kontextech
- Získat zkušenosti s odstraňováním problémů a laděním reálných scénářů nasazení

## Výsledky učení

Po dokončení těchto příkladů budete schopni:
- Sebevědomě nasazovat různé typy aplikací pomocí Azure Developer CLI
- Přizpůsobit poskytnuté šablony vlastním požadavkům aplikace
- Navrhovat a implementovat vlastní vzory infrastruktury pomocí Bicep
- Konfigurovat složité aplikace s více službami a správnými závislostmi
- Aplikovat osvědčené postupy pro bezpečnost, monitorování a výkon v reálných scénářích
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

## Rychlé příklady

### Pro začátečníky
1. **[Jednoduchá webová aplikace](../../../examples/simple-web-app)** - Nasazení základní webové aplikace v Node.js
2. **[Statická webová stránka](../../../examples/static-website)** - Hostování statické webové stránky na Azure Storage
3. **[Kontejnerová aplikace](../../../examples/container-app)** - Nasazení aplikace v kontejneru

### Pro pokročilé uživatele
4. **[Aplikace s databází](../../../examples/database-app)** - Webová aplikace s databází PostgreSQL
5. **[Serverless funkce](../../../examples/serverless-function)** - Azure Functions s HTTP triggery
6. **[Mikroslužby](../../../examples/microservices)** - Aplikace s více službami a API bránou

## 📋 Návod k použití

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

3. **Nakonfigurujte prostředí**
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
- Nákladově efektivní vývojová prostředí

#### **Pokročilé scénáře**
- Architektury s více službami
- Složité konfigurace sítí
- Vzory integrace databází
- Implementace bezpečnosti a souladu

#### **Vzory připravené pro produkci**
- Konfigurace s vysokou dostupností
- Monitorování a pozorovatelnost
- Integrace CI/CD
- Plány obnovy po havárii

## 📖 Popisy příkladů

### Jednoduchá webová aplikace
**Technologie**: Node.js, App Service, Application Insights  
**Složitost**: Začátečník  
**Koncepty**: Základní nasazení, proměnné prostředí, zdravotní kontroly

### Statická webová stránka
**Technologie**: HTML/CSS/JS, Storage Account, CDN  
**Složitost**: Začátečník  
**Koncepty**: Statické hostování, integrace CDN, vlastní domény

### Kontejnerová aplikace
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
- Nasazení do více regionů

### Moduly Bicep
- Znovupoužitelné komponenty infrastruktury
- Běžné vzory zdrojů
- Šablony s posíleným zabezpečením
- Nákladově optimalizované konfigurace

### Pomocné skripty
- Automatizace nastavení prostředí
- Skripty pro migraci databází
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

4. **Bezpečnostní kontrola**
   - Zkontrolujte přístupová oprávnění
   - Implementujte správu tajemství
   - Aktivujte monitorování a upozornění

## 📊 Porovnávací tabulka

| Příklad | Služby | Databáze | Autentizace | Monitorování | Složitost |
|---------|--------|----------|-------------|--------------|-----------|
| Jednoduchá webová aplikace | 1 | ❌ | Základní | Základní | ⭐ |
| Statická webová stránka | 1 | ❌ | ❌ | Základní | ⭐ |
| Kontejnerová aplikace | 1 | ❌ | Základní | Plné | ⭐⭐ |
| Aplikace s databází | 2 | ✅ | Plné | Plné | ⭐⭐⭐ |
| Serverless funkce | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| Mikroslužby | 5+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |

## 🎓 Učební cesta

### Doporučený postup

1. **Začněte s Jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte pracovní postup nasazení
   - Procvičte si správu prostředí

2. **Vyzkoušejte Statickou webovou stránku**
   - Prozkoumejte různé možnosti hostování
   - Naučte se integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na Kontejnerovou aplikaci**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičte si práci s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se zřizování databází
   - Pochopte připojovací řetězce
   - Procvičte si správu tajemství

5. **Prozkoumejte Serverless**
   - Pochopte architekturu řízenou událostmi
   - Naučte se o triggerech a vazbách
   - Procvičte si práci s API

6. **Vytvořte Mikroslužby**
   - Naučte se komunikaci mezi službami
   - Pochopte distribuované systémy
   - Procvičte si složitá nasazení

## 🔍 Výběr správného příkladu

### Podle technologického stacku
- **Node.js**: Jednoduchá webová aplikace, Mikroslužby
- **Python**: Aplikace s databází, Serverless funkce
- **Statické stránky**: Statická webová stránka
- **Kontejnery**: Kontejnerová aplikace, Mikroslužby
- **Databáze**: Aplikace s databází, Serverless funkce

### Podle architektonického vzoru
- **Monolitické**: Jednoduchá webová aplikace, Aplikace s databází
- **Statické**: Statická webová stránka
- **Mikroslužby**: Příklad Mikroslužeb
- **Serverless**: Serverless funkce
- **Hybridní**: Kontejnerová aplikace

### Podle úrovně složitosti
- **Začátečník**: Jednoduchá webová aplikace, Statická webová stránka
- **Středně pokročilý**: Kontejnerová aplikace, Aplikace s databází, Serverless funkce  
- **Pokročilý**: Mikroslužby

## 📚 Další zdroje

### Odkazy na dokumentaci
- [Specifikace šablon AZD](https://aka.ms/azd/templates)
- [Dokumentace Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Příklady z komunity
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Galerie šablon AZD](https://azure.github.io/awesome-azd/)

### Osvědčené postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Přispívání příkladů

Máte užitečný příklad, o který byste se chtěli podělit? Uvítáme vaše příspěvky!

### Pokyny k odeslání
1. Dodržujte zavedenou strukturu adresářů
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

**Tip**: Začněte s nejjednodušším příkladem, který odpovídá vašemu technologickému stacku, a postupně přecházejte k složitějším scénářům. Každý příklad staví na konceptech z předchozích!

**Další kroky**: 
- Vyberte si příklad odpovídající vaší úrovni dovedností
- Postupujte podle pokynů k nastavení v README příkladu
- Experimentujte s přizpůsobením
- Sdílejte své poznatky s komunitou

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](../resources/study-guide.md)
- **Návrat na**: [Hlavní README](../README.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné výklady vyplývající z použití tohoto překladu.