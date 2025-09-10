<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:11:03+00:00",
  "source_file": "examples/README.md",
  "language_code": "no"
}
-->
# Eksempler - Praktiske AZD-maler og konfigurasjoner

## Introduksjon

Denne katalogen inneholder praktiske eksempler, maler og virkelige scenarier for å hjelpe deg med å lære Azure Developer CLI gjennom praktisk øving. Hvert eksempel gir komplett fungerende kode, infrastrukturemaler og detaljerte instruksjoner for ulike applikasjonsarkitekturer og distribusjonsmønstre.

## Læringsmål

Ved å jobbe gjennom disse eksemplene vil du:
- Øve på Azure Developer CLI-arbeidsflyter med realistiske applikasjonsscenarier
- Forstå ulike applikasjonsarkitekturer og deres azd-implementeringer
- Mestre Infrastructure as Code-mønstre for ulike Azure-tjenester
- Anvende konfigurasjonsstyring og distribusjonsstrategier for spesifikke miljøer
- Implementere overvåking, sikkerhet og skaleringsmønstre i praktiske sammenhenger
- Bygge erfaring med feilsøking og debugging av reelle distribusjonsscenarier

## Læringsutbytte

Når du har fullført disse eksemplene, vil du kunne:
- Trygt distribuere ulike applikasjonstyper ved hjelp av Azure Developer CLI
- Tilpasse de medfølgende malene til dine egne applikasjonsbehov
- Designe og implementere tilpassede infrastrukturmønstre ved hjelp av Bicep
- Konfigurere komplekse applikasjoner med flere tjenester og riktige avhengigheter
- Anvende beste praksis for sikkerhet, overvåking og ytelse i virkelige scenarier
- Feilsøke og optimalisere distribusjoner basert på praktisk erfaring

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

## Hurtigstart-eksempler

### For nybegynnere
1. **[Enkel webapplikasjon](../../../examples/simple-web-app)** - Distribuer en grunnleggende Node.js-webapplikasjon
2. **[Statisk nettsted](../../../examples/static-website)** - Host et statisk nettsted på Azure Storage
3. **[Container-applikasjon](../../../examples/container-app)** - Distribuer en containerisert applikasjon

### For viderekomne brukere
4. **[Database-applikasjon](../../../examples/database-app)** - Webapplikasjon med PostgreSQL-database
5. **[Serverløs funksjon](../../../examples/serverless-function)** - Azure Functions med HTTP-triggere
6. **[Mikrotjenester](../../../examples/microservices)** - Applikasjon med flere tjenester og API-gateway

## 📋 Bruksanvisning

### Kjøre eksempler lokalt

1. **Klon eller kopier eksempel**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialiser AZD-miljø**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurer miljø**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuer**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Tilpasse eksempler

Hvert eksempel inkluderer:
- **README.md** - Detaljerte oppsett- og tilpasningsinstruksjoner
- **azure.yaml** - AZD-konfigurasjon med kommentarer
- **infra/** - Bicep-maler med parameterforklaringer
- **src/** - Eksempelkode for applikasjoner
- **scripts/** - Hjelpeskript for vanlige oppgaver

## 🎯 Læringsmål

### Eksempelkategorier

#### **Grunnleggende distribusjoner**
- Applikasjoner med én tjeneste
- Enkle infrastrukturmønstre
- Grunnleggende konfigurasjonsstyring
- Kostnadseffektive utviklingsoppsett

#### **Avanserte scenarier**
- Arkitekturer med flere tjenester
- Komplekse nettverkskonfigurasjoner
- Databaseintegrasjonsmønstre
- Implementeringer for sikkerhet og samsvar

#### **Produksjonsklare mønstre**
- Konfigurasjoner for høy tilgjengelighet
- Overvåking og observabilitet
- CI/CD-integrasjon
- Oppsett for katastrofegjenoppretting

## 📖 Eksempeldeskripsjoner

### Enkel webapplikasjon
**Teknologier**: Node.js, App Service, Application Insights  
**Kompleksitet**: Nybegynner  
**Konsepter**: Grunnleggende distribusjon, miljøvariabler, helsesjekker

### Statisk nettsted
**Teknologier**: HTML/CSS/JS, Storage Account, CDN  
**Kompleksitet**: Nybegynner  
**Konsepter**: Statisk hosting, CDN-integrasjon, egendefinerte domener

### Container-applikasjon
**Teknologier**: Docker, Container Apps, Container Registry  
**Kompleksitet**: Viderekommen  
**Konsepter**: Containerisering, skalering, ingress-konfigurasjon

### Database-applikasjon
**Teknologier**: Python Flask, PostgreSQL, App Service  
**Kompleksitet**: Viderekommen  
**Konsepter**: Databaseforbindelser, hemmelighetshåndtering, migrasjoner

### Serverløs funksjon
**Teknologier**: Azure Functions, Cosmos DB, API Management  
**Kompleksitet**: Viderekommen  
**Konsepter**: Hendelsesdrevet arkitektur, bindings, API-håndtering

### Mikrotjenester
**Teknologier**: Flere tjenester, Service Bus, API Gateway  
**Kompleksitet**: Avansert  
**Konsepter**: Tjenestekommunikasjon, meldingskøer, lastbalansering

## 🛠 Konfigurasjonseksempler

Katalogen `configurations/` inneholder gjenbrukbare komponenter:

### Miljøkonfigurasjoner
- Innstillinger for utviklingsmiljø
- Konfigurasjoner for staging-miljø
- Produksjonsklare konfigurasjoner
- Distribusjonsoppsett for flere regioner

### Bicep-moduler
- Gjenbrukbare infrastrukturkomponenter
- Vanlige ressursmønstre
- Sikkerhetsherdede maler
- Kostnadsoptimaliserte konfigurasjoner

### Hjelpeskript
- Automatisering av miljøoppsett
- Skript for databasemigrering
- Verktøy for validering av distribusjoner
- Kostnadsovervåkingsverktøy

## 🔧 Tilpasningsveiledning

### Tilpasse eksempler til ditt brukstilfelle

1. **Gjennomgå forutsetninger**
   - Sjekk krav til Azure-tjenester
   - Verifiser abonnementsgrenser
   - Forstå kostnadsimplikasjoner

2. **Endre konfigurasjon**
   - Oppdater tjenestedefinisjoner i `azure.yaml`
   - Tilpass Bicep-maler
   - Juster miljøvariabler

3. **Test grundig**
   - Distribuer først til utviklingsmiljø
   - Valider funksjonalitet
   - Test skalering og ytelse

4. **Sikkerhetsgjennomgang**
   - Gjennomgå tilgangskontroller
   - Implementer hemmelighetshåndtering
   - Aktiver overvåking og varsling

## 📊 Sammenligningsmatrise

| Eksempel | Tjenester | Database | Autentisering | Overvåking | Kompleksitet |
|----------|-----------|----------|---------------|------------|--------------|
| Enkel webapplikasjon | 1 | ❌ | Grunnleggende | Grunnleggende | ⭐ |
| Statisk nettsted | 1 | ❌ | ❌ | Grunnleggende | ⭐ |
| Container-applikasjon | 1 | ❌ | Grunnleggende | Full | ⭐⭐ |
| Database-applikasjon | 2 | ✅ | Full | Full | ⭐⭐⭐ |
| Serverløs funksjon | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| Mikrotjenester | 5+ | ✅ | Full | Full | ⭐⭐⭐⭐ |

## 🎓 Læringssti

### Anbefalt progresjon

1. **Start med Enkel webapplikasjon**
   - Lær grunnleggende AZD-konsepter
   - Forstå distribusjonsarbeidsflyt
   - Øv på miljøstyring

2. **Prøv Statisk nettsted**
   - Utforsk ulike hostingalternativer
   - Lær om CDN-integrasjon
   - Forstå DNS-konfigurasjon

3. **Gå videre til Container-applikasjon**
   - Lær grunnleggende containerisering
   - Forstå skalering
   - Øv med Docker

4. **Legg til databaseintegrasjon**
   - Lær databaseprovisjonering
   - Forstå tilkoblingsstrenger
   - Øv på hemmelighetshåndtering

5. **Utforsk Serverløs**
   - Forstå hendelsesdrevet arkitektur
   - Lær om triggere og bindings
   - Øv med API-er

6. **Bygg Mikrotjenester**
   - Lær tjenestekommunikasjon
   - Forstå distribuerte systemer
   - Øv på komplekse distribusjoner

## 🔍 Finne riktig eksempel

### Etter teknologistack
- **Node.js**: Enkel webapplikasjon, Mikrotjenester
- **Python**: Database-applikasjon, Serverløs funksjon
- **Statiske nettsteder**: Statisk nettsted
- **Containere**: Container-applikasjon, Mikrotjenester
- **Databaser**: Database-applikasjon, Serverløs funksjon

### Etter arkitekturmønster
- **Monolittisk**: Enkel webapplikasjon, Database-applikasjon
- **Statisk**: Statisk nettsted
- **Mikrotjenester**: Mikrotjenester-eksempel
- **Serverløs**: Serverløs funksjon
- **Hybrid**: Container-applikasjon

### Etter kompleksitetsnivå
- **Nybegynner**: Enkel webapplikasjon, Statisk nettsted
- **Viderekommen**: Container-applikasjon, Database-applikasjon, Serverløs funksjon  
- **Avansert**: Mikrotjenester

## 📚 Ekstra ressurser

### Dokumentasjonslenker
- [AZD Template Specification](https://aka.ms/azd/templates)
- [Bicep Dokumentasjon](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Fellesskapseksempler
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

### Beste praksis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med eksempler

Har du et nyttig eksempel å dele? Vi ønsker bidrag velkommen!

### Retningslinjer for innsending
1. Følg den etablerte katalogstrukturen
2. Inkluder en omfattende README.md
3. Legg til kommentarer i konfigurasjonsfiler
4. Test grundig før innsending
5. Inkluder kostnadsestimater og forutsetninger

### Eksempelmalestruktur
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

**Tips**: Start med det enkleste eksempelet som passer din teknologistack, og jobb deg gradvis opp til mer komplekse scenarier. Hvert eksempel bygger på konsepter fra de forrige!

**Neste steg**: 
- Velg et eksempel som passer ditt ferdighetsnivå
- Følg oppsettsinstruksjonene i eksempelets README
- Eksperimenter med tilpasninger
- Del dine erfaringer med fellesskapet

---

**Navigasjon**
- **Forrige leksjon**: [Studieguide](../resources/study-guide.md)
- **Tilbake til**: [Hoved README](../README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.