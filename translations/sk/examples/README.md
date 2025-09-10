<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:24:41+00:00",
  "source_file": "examples/README.md",
  "language_code": "sk"
}
-->
# Príklady - Praktické šablóny a konfigurácie AZD

## Úvod

Tento adresár obsahuje praktické príklady, šablóny a scenáre z reálneho sveta, ktoré vám pomôžu naučiť sa Azure Developer CLI prostredníctvom praktického cvičenia. Každý príklad poskytuje kompletný funkčný kód, šablóny infraštruktúry a podrobné pokyny pre rôzne architektúry aplikácií a vzory nasadenia.

## Ciele učenia

Prácou na týchto príkladoch sa naučíte:
- Praktizovať pracovné postupy Azure Developer CLI s realistickými scenármi aplikácií
- Pochopiť rôzne architektúry aplikácií a ich implementácie pomocou AZD
- Ovládnuť vzory Infrastructure as Code pre rôzne služby Azure
- Aplikovať stratégie správy konfigurácie a nasadenia špecifické pre prostredie
- Implementovať monitorovacie, bezpečnostné a škálovacie vzory v praktických kontextoch
- Získať skúsenosti s riešením problémov a ladením reálnych scenárov nasadenia

## Výsledky učenia

Po dokončení týchto príkladov budete schopní:
- S istotou nasadiť rôzne typy aplikácií pomocou Azure Developer CLI
- Prispôsobiť poskytnuté šablóny vlastným požiadavkám aplikácie
- Navrhnúť a implementovať vlastné infraštruktúrne vzory pomocou Bicep
- Konfigurovať komplexné aplikácie s viacerými službami a správnymi závislosťami
- Aplikovať bezpečnostné, monitorovacie a výkonnostné osvedčené postupy v reálnych scenároch
- Riešiť problémy a optimalizovať nasadenia na základe praktických skúseností

## Štruktúra adresára

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

## Príklady rýchleho štartu

### Pre začiatočníkov
1. **[Jednoduchá webová aplikácia](../../../examples/simple-web-app)** - Nasadenie základnej webovej aplikácie Node.js
2. **[Statická webová stránka](../../../examples/static-website)** - Hostovanie statickej webovej stránky na Azure Storage
3. **[Aplikácia v kontajneri](../../../examples/container-app)** - Nasadenie aplikácie v kontajneri

### Pre pokročilých používateľov
4. **[Aplikácia s databázou](../../../examples/database-app)** - Webová aplikácia s databázou PostgreSQL
5. **[Serverless funkcia](../../../examples/serverless-function)** - Azure Functions s HTTP triggermi
6. **[Mikroslužby](../../../examples/microservices)** - Aplikácia s viacerými službami a API gateway

## 📋 Pokyny na používanie

### Spustenie príkladov lokálne

1. **Klonovanie alebo kopírovanie príkladu**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializácia prostredia AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurácia prostredia**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasadenie**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Prispôsobenie príkladov

Každý príklad obsahuje:
- **README.md** - Podrobné pokyny na nastavenie a prispôsobenie
- **azure.yaml** - Konfigurácia AZD s komentármi
- **infra/** - Šablóny Bicep s vysvetlením parametrov
- **src/** - Ukážkový kód aplikácie
- **scripts/** - Pomocné skripty pre bežné úlohy

## 🎯 Ciele učenia

### Kategórie príkladov

#### **Základné nasadenia**
- Aplikácie s jednou službou
- Jednoduché infraštruktúrne vzory
- Základná správa konfigurácie
- Nákladovo efektívne vývojové nastavenia

#### **Pokročilé scenáre**
- Architektúry s viacerými službami
- Komplexné konfigurácie sietí
- Vzory integrácie databáz
- Implementácie bezpečnosti a súladu

#### **Vzory pripravené na produkciu**
- Konfigurácie vysokej dostupnosti
- Monitorovanie a pozorovateľnosť
- Integrácia CI/CD
- Nastavenia obnovy po havárii

## 📖 Popisy príkladov

### Jednoduchá webová aplikácia
**Technológie**: Node.js, App Service, Application Insights  
**Komplexnosť**: Začiatočník  
**Koncepty**: Základné nasadenie, premenné prostredia, kontrola stavu

### Statická webová stránka
**Technológie**: HTML/CSS/JS, Storage Account, CDN  
**Komplexnosť**: Začiatočník  
**Koncepty**: Statické hostovanie, integrácia CDN, vlastné domény

### Aplikácia v kontajneri
**Technológie**: Docker, Container Apps, Container Registry  
**Komplexnosť**: Stredne pokročilý  
**Koncepty**: Kontajnerizácia, škálovanie, konfigurácia prístupu

### Aplikácia s databázou
**Technológie**: Python Flask, PostgreSQL, App Service  
**Komplexnosť**: Stredne pokročilý  
**Koncepty**: Pripojenia k databáze, správa tajomstiev, migrácie

### Serverless funkcia
**Technológie**: Azure Functions, Cosmos DB, API Management  
**Komplexnosť**: Stredne pokročilý  
**Koncepty**: Architektúra riadená udalosťami, väzby, správa API

### Mikroslužby
**Technológie**: Viac služieb, Service Bus, API Gateway  
**Komplexnosť**: Pokročilý  
**Koncepty**: Komunikácia medzi službami, fronty správ, vyvažovanie záťaže

## 🛠 Príklady konfigurácie

Adresár `configurations/` obsahuje opakovane použiteľné komponenty:

### Konfigurácie prostredia
- Nastavenia vývojového prostredia
- Konfigurácie staging prostredia
- Konfigurácie pripravené na produkciu
- Nastavenia nasadenia do viacerých regiónov

### Moduly Bicep
- Opakovane použiteľné infraštruktúrne komponenty
- Bežné vzory zdrojov
- Šablóny s posilnenou bezpečnosťou
- Nákladovo optimalizované konfigurácie

### Pomocné skripty
- Automatizácia nastavenia prostredia
- Skripty na migráciu databázy
- Nástroje na validáciu nasadenia
- Nástroje na monitorovanie nákladov

## 🔧 Príručka prispôsobenia

### Prispôsobenie príkladov pre vaše potreby

1. **Skontrolujte predpoklady**
   - Overte požiadavky na služby Azure
   - Skontrolujte limity predplatného
   - Pochopte nákladové dôsledky

2. **Upravte konfiguráciu**
   - Aktualizujte definície služieb v `azure.yaml`
   - Prispôsobte šablóny Bicep
   - Upravte premenné prostredia

3. **Dôkladne otestujte**
   - Najskôr nasadzujte do vývojového prostredia
   - Overte funkčnosť
   - Testujte škálovanie a výkon

4. **Bezpečnostná kontrola**
   - Skontrolujte prístupové kontroly
   - Implementujte správu tajomstiev
   - Aktivujte monitorovanie a upozornenia

## 📊 Porovnávacia tabuľka

| Príklad | Služby | Databáza | Autentifikácia | Monitorovanie | Komplexnosť |
|---------|----------|----------|------|------------|------------|
| Jednoduchá webová aplikácia | 1 | ❌ | Základná | Základná | ⭐ |
| Statická webová stránka | 1 | ❌ | ❌ | Základná | ⭐ |
| Aplikácia v kontajneri | 1 | ❌ | Základná | Plná | ⭐⭐ |
| Aplikácia s databázou | 2 | ✅ | Plná | Plná | ⭐⭐⭐ |
| Serverless funkcia | 3 | ✅ | Plná | Plná | ⭐⭐⭐ |
| Mikroslužby | 5+ | ✅ | Plná | Plná | ⭐⭐⭐⭐ |

## 🎓 Učebná cesta

### Odporúčaný postup

1. **Začnite s jednoduchou webovou aplikáciou**
   - Naučte sa základné koncepty AZD
   - Pochopte pracovný postup nasadenia
   - Precvičte si správu prostredia

2. **Vyskúšajte statickú webovú stránku**
   - Preskúmajte rôzne možnosti hostovania
   - Naučte sa o integrácii CDN
   - Pochopte konfiguráciu DNS

3. **Prejdite na aplikáciu v kontajneri**
   - Naučte sa základy kontajnerizácie
   - Pochopte koncepty škálovania
   - Precvičte si prácu s Dockerom

4. **Pridajte integráciu databázy**
   - Naučte sa poskytovanie databáz
   - Pochopte reťazce pripojenia
   - Precvičte si správu tajomstiev

5. **Preskúmajte serverless**
   - Pochopte architektúru riadenú udalosťami
   - Naučte sa o triggeroch a väzbách
   - Precvičte si prácu s API

6. **Vytvorte mikroslužby**
   - Naučte sa komunikáciu medzi službami
   - Pochopte distribuované systémy
   - Precvičte si komplexné nasadenia

## 🔍 Výber správneho príkladu

### Podľa technologického stacku
- **Node.js**: Jednoduchá webová aplikácia, Mikroslužby
- **Python**: Aplikácia s databázou, Serverless funkcia
- **Statické stránky**: Statická webová stránka
- **Kontajnery**: Aplikácia v kontajneri, Mikroslužby
- **Databázy**: Aplikácia s databázou, Serverless funkcia

### Podľa architektonického vzoru
- **Monolitické**: Jednoduchá webová aplikácia, Aplikácia s databázou
- **Statické**: Statická webová stránka
- **Mikroslužby**: Príklad mikroslužieb
- **Serverless**: Serverless funkcia
- **Hybridné**: Aplikácia v kontajneri

### Podľa úrovne komplexnosti
- **Začiatočník**: Jednoduchá webová aplikácia, Statická webová stránka
- **Stredne pokročilý**: Aplikácia v kontajneri, Aplikácia s databázou, Serverless funkcia  
- **Pokročilý**: Mikroslužby

## 📚 Ďalšie zdroje

### Odkazy na dokumentáciu
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentácia Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Príklady z komunity
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### Osvedčené postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispievanie príkladov

Máte užitočný príklad na zdieľanie? Privítame vaše príspevky!

### Pokyny na odoslanie
1. Dodržujte stanovenú štruktúru adresára
2. Zahrňte komplexný README.md
3. Pridajte komentáre ku konfiguračným súborom
4. Dôkladne otestujte pred odoslaním
5. Zahrňte odhady nákladov a predpoklady

### Štruktúra šablóny príkladu
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

**Tip**: Začnite s najjednoduchším príkladom, ktorý zodpovedá vášmu technologickému stacku, a postupne prechádzajte k zložitejším scenárom. Každý príklad stavia na konceptoch z predchádzajúcich!

**Ďalšie kroky**: 
- Vyberte si príklad, ktorý zodpovedá vašej úrovni zručností
- Postupujte podľa pokynov na nastavenie v README daného príkladu
- Experimentujte s prispôsobeniami
- Zdieľajte svoje poznatky s komunitou

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](../resources/study-guide.md)
- **Návrat na**: [Hlavné README](../README.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby na automatický preklad [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, upozorňujeme, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.