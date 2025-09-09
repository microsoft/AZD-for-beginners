<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T22:36:54+00:00",
  "source_file": "resources/faq.md",
  "language_code": "da"
}
-->
# Ofte Stillede Spørgsmål (FAQ)

## Introduktion

Denne omfattende FAQ giver svar på de mest almindelige spørgsmål om Azure Developer CLI (azd) og Azure-udrulninger. Find hurtige løsninger på almindelige problemer, forstå bedste praksis, og få klarhed over azd-koncepter og arbejdsgange.

## Læringsmål

Ved at gennemgå denne FAQ vil du:
- Finde hurtige svar på almindelige spørgsmål og problemer med Azure Developer CLI
- Forstå nøglekoncepter og terminologi gennem en praktisk Q&A-format
- Få adgang til fejlfinding af hyppige problemer og fejlscenarier
- Lære bedste praksis gennem ofte stillede spørgsmål om optimering
- Opdage avancerede funktioner og kapaciteter gennem ekspertspørgsmål
- Effektivt referere til vejledning om omkostninger, sikkerhed og udrulningsstrategier

## Læringsresultater

Ved regelmæssig brug af denne FAQ vil du kunne:
- Løse almindelige problemer med Azure Developer CLI selvstændigt ved hjælp af de angivne løsninger
- Træffe informerede beslutninger om udrulningsstrategier og konfigurationer
- Forstå forholdet mellem azd og andre Azure-værktøjer og -tjenester
- Anvende bedste praksis baseret på fællesskabets erfaringer og ekspertrekommendationer
- Fejlsøge autentificerings-, udrulnings- og konfigurationsproblemer effektivt
- Optimere omkostninger og ydeevne ved hjælp af FAQ-indsigter og anbefalinger

## Indholdsfortegnelse

- [Kom godt i gang](../../../resources)
- [Autentificering & Adgang](../../../resources)
- [Skabeloner & Projekter](../../../resources)
- [Udrulning & Infrastruktur](../../../resources)
- [Konfiguration & Miljøer](../../../resources)
- [Fejlfinding](../../../resources)
- [Omkostninger & Fakturering](../../../resources)
- [Bedste Praksis](../../../resources)
- [Avancerede Emner](../../../resources)

---

## Kom godt i gang

### Q: Hvad er Azure Developer CLI (azd)?
**A**: Azure Developer CLI (azd) er et udviklerfokuseret kommandolinjeværktøj, der fremskynder tiden det tager at få din applikation fra den lokale udviklingsmiljø til Azure. Det tilbyder bedste praksis gennem skabeloner og hjælper med hele udrulningslivscyklussen.

### Q: Hvordan adskiller azd sig fra Azure CLI?
**A**: 
- **Azure CLI**: Generelt værktøj til styring af Azure-ressourcer
- **azd**: Udviklerfokuseret værktøj til applikationsudrulningsarbejdsgange
- azd bruger Azure CLI internt, men tilbyder højere niveau-abstraktioner til almindelige udviklingsscenarier
- azd inkluderer skabeloner, miljøstyring og udrulningsautomatisering

### Q: Skal jeg have Azure CLI installeret for at bruge azd?
**A**: Ja, azd kræver Azure CLI til autentificering og nogle operationer. Installer Azure CLI først, og derefter azd.

### Q: Hvilke programmeringssprog understøtter azd?
**A**: azd er sprogagnostisk. Det fungerer med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statiske websites
- Containeriserede applikationer

### Q: Kan jeg bruge azd med eksisterende projekter?
**A**: Ja! Du kan enten:
1. Bruge `azd init` til at tilføje azd-konfiguration til eksisterende projekter
2. Tilpasse eksisterende projekter til at matche azd-skabelonstrukturen
3. Oprette brugerdefinerede skabeloner baseret på din eksisterende arkitektur

---

## Autentificering & Adgang

### Q: Hvordan autentificerer jeg med Azure ved hjælp af azd?
**A**: Brug `azd auth login`, som åbner et browservindue til Azure-autentificering. Til CI/CD-scenarier skal du bruge serviceprincipaler eller administrerede identiteter.

### Q: Kan jeg bruge azd med flere Azure-abonnementer?
**A**: Ja. Brug `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` for at angive, hvilket abonnement der skal bruges for hvert miljø.

### Q: Hvilke tilladelser har jeg brug for til at udrulle med azd?
**A**: Typisk har du brug for:
- **Contributor**-rolle på ressourcegruppen eller abonnementet
- **User Access Administrator**, hvis du udruller ressourcer, der kræver rolle-tildelinger
- Specifikke tilladelser varierer afhængigt af skabelonen og de ressourcer, der udrulles

### Q: Kan jeg bruge azd i CI/CD-pipelines?
**A**: Absolut! azd er designet til CI/CD-integration. Brug serviceprincipaler til autentificering og sæt miljøvariabler til konfiguration.

### Q: Hvordan håndterer jeg autentificering i GitHub Actions?
**A**: Brug Azure Login-action med serviceprincipaloplysninger:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Skabeloner & Projekter

### Q: Hvor kan jeg finde azd-skabeloner?
**A**: 
- Officielle skabeloner: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Fællesskabsskabeloner: GitHub-søgning efter "azd-template"
- Brug `azd template list` for at gennemse tilgængelige skabeloner

### Q: Hvordan opretter jeg en brugerdefineret skabelon?
**A**: 
1. Start med en eksisterende skabelonstruktur
2. Rediger `azure.yaml`, infrastrukturfiler og applikationskode
3. Test grundigt med `azd up`
4. Udgiv til GitHub med passende tags

### Q: Kan jeg bruge azd uden en skabelon?
**A**: Ja, brug `azd init` i et eksisterende projekt for at oprette de nødvendige konfigurationsfiler. Du skal manuelt konfigurere `azure.yaml` og infrastrukturfiler.

### Q: Hvad er forskellen mellem officielle og fællesskabsskabeloner?
**A**: 
- **Officielle skabeloner**: Vedligeholdt af Microsoft, regelmæssigt opdateret, omfattende dokumentation
- **Fællesskabsskabeloner**: Oprettet af udviklere, kan have specialiserede anvendelsestilfælde, varierende kvalitet og vedligeholdelse

### Q: Hvordan opdaterer jeg en skabelon i mit projekt?
**A**: Skabeloner opdateres ikke automatisk. Du kan:
1. Manuelt sammenligne og flette ændringer fra kilde-skabelonen
2. Starte forfra med `azd init` ved hjælp af den opdaterede skabelon
3. Cherry-picke specifikke forbedringer fra opdaterede skabeloner

---

## Udrulning & Infrastruktur

### Q: Hvilke Azure-tjenester kan azd udrulle?
**A**: azd kan udrulle enhver Azure-tjeneste gennem Bicep/ARM-skabeloner, herunder:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Netværk, sikkerhed og overvågningsressourcer

### Q: Kan jeg udrulle til flere regioner?
**A**: Ja, konfigurer flere regioner i dine Bicep-skabeloner og angiv lokationsparameteren passende for hvert miljø.

### Q: Hvordan håndterer jeg database-skema-migreringer?
**A**: Brug udrulningshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Kan jeg kun udrulle infrastruktur uden applikationer?
**A**: Ja, brug `azd provision` til kun at udrulle de infrastrukturelementer, der er defineret i dine skabeloner.

### Q: Hvordan udruller jeg til eksisterende Azure-ressourcer?
**A**: Dette er komplekst og ikke direkte understøttet. Du kan:
1. Importere eksisterende ressourcer i dine Bicep-skabeloner
2. Bruge eksisterende ressource-referencer i skabeloner
3. Redigere skabeloner til betinget at oprette eller referere ressourcer

### Q: Kan jeg bruge Terraform i stedet for Bicep?
**A**: I øjeblikket understøtter azd primært Bicep/ARM-skabeloner. Terraform-understøttelse er ikke officielt tilgængelig, selvom fællesskabsløsninger kan eksistere.

---

## Konfiguration & Miljøer

### Q: Hvordan administrerer jeg forskellige miljøer (dev, staging, prod)?
**A**: Opret separate miljøer med `azd env new <environment-name>` og konfigurer forskellige indstillinger for hvert:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Hvor gemmes miljøkonfigurationer?
**A**: I `.azure`-mappen inden for din projektmappe. Hvert miljø har sin egen mappe med konfigurationsfiler.

### Q: Hvordan indstiller jeg miljøspecifik konfiguration?
**A**: Brug `azd env set` til at konfigurere miljøvariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Kan jeg dele miljøkonfigurationer med teammedlemmer?
**A**: `.azure`-mappen indeholder følsomme oplysninger og bør ikke forpligtes til versionskontrol. I stedet:
1. Dokumenter nødvendige miljøvariabler
2. Brug udrulningsscripts til at opsætte miljøer
3. Brug Azure Key Vault til følsom konfiguration

### Q: Hvordan overskriver jeg skabelonstandarder?
**A**: Indstil miljøvariabler, der svarer til skabelonparametre:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Fejlfinding

### Q: Hvorfor fejler `azd up`?
**A**: Almindelige årsager:
1. **Autentificeringsproblemer**: Kør `azd auth login`
2. **Utilstrækkelige tilladelser**: Tjek dine Azure-rolle-tildelinger
3. **Ressourcenavnekonflikter**: Ændr AZURE_ENV_NAME
4. **Kvota/kapacitetsproblemer**: Tjek regional tilgængelighed
5. **Skabelonfejl**: Valider Bicep-skabeloner

### Q: Hvordan fejlsøger jeg udrulningsfejl?
**A**: 
1. Brug `azd deploy --debug` for detaljeret output
2. Tjek Azure-portalen for udrulningshistorik
3. Gennemgå aktivitetsloggen i Azure-portalen
4. Brug `azd show` til at vise den aktuelle miljøtilstand

### Q: Hvorfor fungerer mine miljøvariabler ikke?
**A**: Tjek:
1. Variabelnavne matcher skabelonparametre præcist
2. Værdier er korrekt citeret, hvis de indeholder mellemrum
3. Miljøet er valgt: `azd env select <environment>`
4. Variabler er indstillet i det korrekte miljø

### Q: Hvordan rydder jeg op efter mislykkede udrulninger?
**A**: 
```bash
azd down --force --purge
```
Dette fjerner alle ressourcer og miljøkonfiguration.

### Q: Hvorfor er min applikation ikke tilgængelig efter udrulning?
**A**: Tjek:
1. Udrulningen blev gennemført succesfuldt
2. Applikationen kører (tjek logs i Azure-portalen)
3. Netværkssikkerhedsgrupper tillader trafik
4. DNS/tilpassede domæner er korrekt konfigureret

---

## Omkostninger & Fakturering

### Q: Hvor meget vil azd-udrulninger koste?
**A**: Omkostninger afhænger af:
- Azure-tjenester, der udrulles
- Tjenesteniveauer/SKU'er valgt
- Regionale prisforskelle
- Brugsadfærd

Brug [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) til estimater.

### Q: Hvordan kontrollerer jeg omkostninger i azd-udrulninger?
**A**: 
1. Brug lavere niveau-SKU'er til udviklingsmiljøer
2. Opsæt Azure-budgetter og alarmer
3. Brug `azd down` til at fjerne ressourcer, når de ikke er nødvendige
4. Vælg passende regioner (omkostninger varierer efter placering)
5. Brug Azure Cost Management-værktøjer

### Q: Er der gratis niveauer for azd-skabeloner?
**A**: Mange Azure-tjenester tilbyder gratis niveauer:
- App Service: Gratis niveau tilgængeligt
- Azure Functions: 1M gratis eksekveringer/måned
- Cosmos DB: Gratis niveau med 400 RU/s
- Application Insights: Første 5GB/måned gratis

Konfigurer skabeloner til at bruge gratis niveauer, hvor det er muligt.

### Q: Hvordan estimerer jeg omkostninger før udrulning?
**A**: 
1. Gennemgå skabelonens `main.bicep` for at se, hvilke ressourcer der oprettes
2. Brug Azure Pricing Calculator med specifikke SKU'er
3. Udrul til et udviklingsmiljø først for at overvåge faktiske omkostninger
4. Brug Azure Cost Management til detaljeret omkostningsanalyse

---

## Bedste Praksis

### Q: Hvad er bedste praksis for azd-projektstruktur?
**A**: 
1. Hold applikationskode adskilt fra infrastruktur
2. Brug meningsfulde servicenavne i `azure.yaml`
3. Implementer korrekt fejlhåndtering i build-scripts
4. Brug miljøspecifik konfiguration
5. Inkluder omfattende dokumentation

### Q: Hvordan organiserer jeg flere tjenester i azd?
**A**: Brug den anbefalede struktur:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Skal jeg forpligte `.azure`-mappen til versionskontrol?
**A**: **Nej!** `.azure`-mappen indeholder følsomme oplysninger. Tilføj den til `.gitignore`:
```gitignore
.azure/
```

### Q: Hvordan håndterer jeg hemmeligheder og følsom konfiguration?
**A**: 
1. Brug Azure Key Vault til hemmeligheder
2. Referer Key Vault-hemmeligheder i applikationskonfiguration
3. Forpligt aldrig hemmeligheder til versionskontrol
4. Brug administrerede identiteter til service-til-service-autentificering

### Q: Hvad er den anbefalede tilgang til CI/CD med azd?
**A**: 
1. Brug separate miljøer til hver fase (dev/staging/prod)
2. Implementer automatiseret test før udrulning
3. Brug serviceprincipaler til autentificering
4. Gem følsom konfiguration i pipeline-hemmeligheder/variabler
5. Implementer godkendelsesporte til produktionsudrulninger

---

## Avancerede Emner

### Q: Kan jeg udvide azd med brugerdefineret funktionalitet?
**A**: Ja, gennem udrulningshooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Hvordan integrerer jeg azd med eksisterende DevOps-processer?
**A**: 
1. Brug azd-kommandoer i eksisterende pipeline-scripts
2. Standardiser på azd-skabeloner på tværs af teams
3. Integrer med eksisterende overvågning og alarmering
4. Brug azd's JSON-output til pipeline-integration

### Q: Kan jeg bruge azd med Azure DevOps?
**A**: Ja, azd fungerer med ethvert CI/CD-system. Opret Azure DevOps-pipelines, der bruger azd-kommandoer.

### Q: Hvordan bidrager jeg til azd eller opretter fællesskabsskabeloner?
**A**: 
1. **azd-værktøj**: Bidrag til [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Skabeloner**: Opret skabeloner efter [skabelonretningslinjerne](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentation**: Bidrag til dokumentation på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Hvad er azd's roadmap?
**A**: Tjek den [officielle roadmap](https://github.com/Azure/azure-dev/projects) for planlagte funktioner og forbedringer.

### Q: Hvordan migrerer jeg fra andre udrulningsværktøjer til azd?
**A**:
1. Analyser den nuværende implementeringsarkitektur  
2. Opret tilsvarende Bicep-skabeloner  
3. Konfigurer `azure.yaml` til at matche de nuværende tjenester  
4. Test grundigt i udviklingsmiljøet  
5. Migrer miljøer gradvist  

---

## Har du stadig spørgsmål?

### **Søg først**  
- Tjek [den officielle dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Søg efter lignende problemer på [GitHub issues](https://github.com/Azure/azure-dev/issues)  

### **Få hjælp**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Fællesskabsstøtte  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniske spørgsmål  
- [Azure Discord](https://discord.gg/azure) - Chat med fællesskabet i realtid  

### **Rapportér problemer**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Fejlrapporter og funktionsanmodninger  
- Inkluder relevante logfiler, fejlmeddelelser og trin til at genskabe problemet  

### **Lær mere**  
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Denne FAQ opdateres regelmæssigt. Sidst opdateret: 9. september 2025*  

---

**Navigation**  
- **Forrige lektion**: [Glossary](glossary.md)  
- **Næste lektion**: [Study Guide](study-guide.md)  

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på at sikre nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os ikke ansvar for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.