<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:17:02+00:00",
  "source_file": "examples/README.md",
  "language_code": "sv"
}
-->
# Exempel - Praktiska AZD-mallar och konfigurationer

## Introduktion

Den här katalogen innehåller praktiska exempel, mallar och verkliga scenarier för att hjälpa dig att lära dig Azure Developer CLI genom praktisk övning. Varje exempel erbjuder komplett fungerande kod, infrastruktursmallar och detaljerade instruktioner för olika applikationsarkitekturer och distributionsmönster.

## Lärandemål

Genom att arbeta igenom dessa exempel kommer du att:
- Öva på Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementeringar
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Tillämpa konfigurationshantering och miljöspecifika distributionsstrategier
- Implementera övervakning, säkerhet och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugging av verkliga distributionsscenarier

## Läranderesultat

När du har slutfört dessa exempel kommer du att kunna:
- Självsäkert distribuera olika applikationstyper med Azure Developer CLI
- Anpassa de tillhandahållna mallarna till dina egna applikationskrav
- Designa och implementera anpassade infrastruktursmönster med Bicep
- Konfigurera komplexa applikationer med flera tjänster och korrekta beroenden
- Tillämpa säkerhets-, övervaknings- och prestandabästa praxis i verkliga scenarier
- Felsöka och optimera distributioner baserat på praktisk erfarenhet

## Katalogstruktur

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

## Snabbstartsexempel

### För nybörjare
1. **[Enkel webbapplikation](../../../examples/simple-web-app)** - Distribuera en grundläggande Node.js-webbapplikation
2. **[Statisk webbplats](../../../examples/static-website)** - Värd för en statisk webbplats på Azure Storage
3. **[Containerapplikation](../../../examples/container-app)** - Distribuera en containeriserad applikation

### För användare på mellannivå
4. **[Databasapplikation](../../../examples/database-app)** - Webbapplikation med PostgreSQL-databas
5. **[Serverlös funktion](../../../examples/serverless-function)** - Azure Functions med HTTP-triggers
6. **[Mikrotjänster](../../../examples/microservices)** - Applikation med flera tjänster och API-gateway

## 📋 Användarinstruktioner

### Köra exempel lokalt

1. **Klona eller kopiera exempel**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initiera AZD-miljö**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurera miljö**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuera**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Anpassa exempel

Varje exempel innehåller:
- **README.md** - Detaljerade instruktioner för installation och anpassning
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-mallar med parameterförklaringar
- **src/** - Exempel på applikationskod
- **scripts/** - Hjälpskript för vanliga uppgifter

## 🎯 Lärandemål

### Exempelkategorier

#### **Grundläggande distributioner**
- Applikationer med en tjänst
- Enkla infrastruktursmönster
- Grundläggande konfigurationshantering
- Kostnadseffektiva utvecklingsmiljöer

#### **Avancerade scenarier**
- Arkitekturer med flera tjänster
- Komplexa nätverkskonfigurationer
- Databasintegrationsmönster
- Implementeringar för säkerhet och efterlevnad

#### **Produktionsklara mönster**
- Konfigurationer för hög tillgänglighet
- Övervakning och insyn
- CI/CD-integrering
- Återställningslösningar vid katastrofer

## 📖 Exempelbeskrivningar

### Enkel webbapplikation
**Teknologier**: Node.js, App Service, Application Insights  
**Komplexitet**: Nybörjare  
**Koncept**: Grundläggande distribution, miljövariabler, hälsokontroller

### Statisk webbplats
**Teknologier**: HTML/CSS/JS, Storage Account, CDN  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, CDN-integrering, anpassade domäner

### Containerapplikation
**Teknologier**: Docker, Container Apps, Container Registry  
**Komplexitet**: Mellannivå  
**Koncept**: Containerisering, skalning, ingresskonfiguration

### Databasapplikation
**Teknologier**: Python Flask, PostgreSQL, App Service  
**Komplexitet**: Mellannivå  
**Koncept**: Databasanslutningar, hantering av hemligheter, migrationer

### Serverlös funktion
**Teknologier**: Azure Functions, Cosmos DB, API Management  
**Komplexitet**: Mellannivå  
**Koncept**: Händelsedriven arkitektur, bindningar, API-hantering

### Mikrotjänster
**Teknologier**: Flera tjänster, Service Bus, API Gateway  
**Komplexitet**: Avancerad  
**Koncept**: Tjänstkommunikation, meddelandeköer, lastbalansering

## 🛠 Konfigurationsexempel

Katalogen `configurations/` innehåller återanvändbara komponenter:

### Miljökonfigurationer
- Inställningar för utvecklingsmiljö
- Konfigurationer för stagingmiljö
- Produktionsklara konfigurationer
- Distributioner över flera regioner

### Bicep-moduler
- Återanvändbara infrastrukturkomponenter
- Vanliga resursmönster
- Säkerhetshärdade mallar
- Kostnadsoptimerade konfigurationer

### Hjälpskript
- Automatisering av miljöinställningar
- Databasmigrationsskript
- Verktyg för validering av distributioner
- Verktyg för kostnadsövervakning

## 🔧 Anpassningsguide

### Anpassa exempel för dina behov

1. **Granska förutsättningar**
   - Kontrollera Azure-tjänstkrav
   - Verifiera prenumerationsgränser
   - Förstå kostnadsimplikationer

2. **Modifiera konfiguration**
   - Uppdatera tjänstdefinitioner i `azure.yaml`
   - Anpassa Bicep-mallar
   - Justera miljövariabler

3. **Testa noggrant**
   - Distribuera först till utvecklingsmiljön
   - Validera funktionalitet
   - Testa skalning och prestanda

4. **Säkerhetsgranskning**
   - Granska åtkomstkontroller
   - Implementera hantering av hemligheter
   - Aktivera övervakning och larm

## 📊 Jämförelsematris

| Exempel | Tjänster | Databas | Autentisering | Övervakning | Komplexitet |
|---------|----------|----------|---------------|-------------|-------------|
| Enkel webbapplikation | 1 | ❌ | Grundläggande | Grundläggande | ⭐ |
| Statisk webbplats | 1 | ❌ | ❌ | Grundläggande | ⭐ |
| Containerapplikation | 1 | ❌ | Grundläggande | Fullständig | ⭐⭐ |
| Databasapplikation | 2 | ✅ | Fullständig | Fullständig | ⭐⭐⭐ |
| Serverlös funktion | 3 | ✅ | Fullständig | Fullständig | ⭐⭐⭐ |
| Mikrotjänster | 5+ | ✅ | Fullständig | Fullständig | ⭐⭐⭐⭐ |

## 🎓 Lärandebana

### Rekommenderad progression

1. **Börja med Enkel webbapplikation**
   - Lär dig grundläggande AZD-koncept
   - Förstå distributionsarbetsflöde
   - Öva på miljöhantering

2. **Prova Statisk webbplats**
   - Utforska olika hostingalternativ
   - Lär dig om CDN-integrering
   - Förstå DNS-konfiguration

3. **Gå vidare till Containerapplikation**
   - Lär dig grunderna i containerisering
   - Förstå skalningskoncept
   - Öva med Docker

4. **Lägg till databasintegration**
   - Lär dig databasprovisionering
   - Förstå anslutningssträngar
   - Öva på hantering av hemligheter

5. **Utforska Serverlös funktion**
   - Förstå händelsedriven arkitektur
   - Lär dig om triggers och bindningar
   - Öva med API:er

6. **Bygg Mikrotjänster**
   - Lär dig tjänstkommunikation
   - Förstå distribuerade system
   - Öva på komplexa distributioner

## 🔍 Hitta rätt exempel

### Efter teknologistack
- **Node.js**: Enkel webbapplikation, Mikrotjänster
- **Python**: Databasapplikation, Serverlös funktion
- **Statiska webbplatser**: Statisk webbplats
- **Containers**: Containerapplikation, Mikrotjänster
- **Databaser**: Databasapplikation, Serverlös funktion

### Efter arkitekturmönster
- **Monolitisk**: Enkel webbapplikation, Databasapplikation
- **Statisk**: Statisk webbplats
- **Mikrotjänster**: Mikrotjänster-exempel
- **Serverlös**: Serverlös funktion
- **Hybrid**: Containerapplikation

### Efter komplexitetsnivå
- **Nybörjare**: Enkel webbapplikation, Statisk webbplats
- **Mellannivå**: Containerapplikation, Databasapplikation, Serverlös funktion  
- **Avancerad**: Mikrotjänster

## 📚 Ytterligare resurser

### Dokumentationslänkar
- [Azure AI Foundry AZD-mallar](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-exempel
- [Azure Samples AZD-mallar](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry-mallar](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar bidrag!

### Riktlinjer för inskick
1. Följ den etablerade katalogstrukturen
2. Inkludera en omfattande README.md
3. Lägg till kommentarer i konfigurationsfiler
4. Testa noggrant innan du skickar in
5. Inkludera kostnadsuppskattningar och förutsättningar

### Exempelmallstruktur
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

**Tips**: Börja med det enklaste exemplet som matchar din teknologistack och arbeta dig gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från det föregående!

**Nästa steg**: 
- Välj ett exempel som matchar din kunskapsnivå
- Följ installationsinstruktionerna i exempelns README
- Experimentera med anpassningar
- Dela dina lärdomar med communityn

---

**Navigering**
- **Föregående lektion**: [Studieguide](../resources/study-guide.md)
- **Återgå till**: [Huvud-README](../README.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som kan uppstå vid användning av denna översättning.