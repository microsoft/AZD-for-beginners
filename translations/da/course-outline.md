<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-17T23:26:01+00:00",
  "source_file": "course-outline.md",
  "language_code": "da"
}
-->
## 8-Kapitlers Læringsstruktur

### Kapitel 1: Grundlag & Hurtig Start (30-45 minutter) 🌱
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Kompleksitet**: ⭐

#### Hvad Du Lærer
- Forståelse af Azure Developer CLI grundprincipper
- Installation af AZD på din platform  
- Din første succesfulde udrulning
- Kernekoncepter og terminologi

#### Læringsressourcer
- [AZD Basics](docs/getting-started/azd-basics.md) - Kernekoncepter
- [Installation & Setup](docs/getting-started/installation.md) - Platform-specifikke vejledninger
- [Your First Project](docs/getting-started/first-project.md) - Praktisk tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Hurtig reference

#### Praktisk Resultat
Udrul en simpel webapplikation til Azure ved hjælp af AZD

---

### Kapitel 2: AI-Først Udvikling (1-2 timer) 🤖
**Forudsætninger**: Kapitel 1 afsluttet  
**Kompleksitet**: ⭐⭐

#### Hvad Du Lærer
- Integration af Azure AI Foundry med AZD
- Udrulning af AI-drevne applikationer
- Forståelse af AI-servicekonfigurationer
- RAG (Retrieval-Augmented Generation) mønstre

#### Læringsressourcer
- [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Praktisk lab
- [Azure AI Foundry Templates](README.md#featured-azure-ai-foundry-templates)

#### Praktisk Resultat
Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktioner

---

### Kapitel 3: Konfiguration & Autentifikation (45-60 minutter) ⚙️
**Forudsætninger**: Kapitel 1 afsluttet  
**Kompleksitet**: ⭐⭐

#### Hvad Du Lærer
- Miljøkonfiguration og -styring
- Autentifikation og sikkerhedsbedste praksis
- Ressourcenavngivning og organisering
- Udrulning på tværs af flere miljøer

#### Læringsressourcer
- [Configuration Guide](docs/getting-started/configuration.md) - Opsætning af miljø
- Sikkerhedsmønstre og administreret identitet
- Eksempler på multi-miljø udrulninger

#### Praktisk Resultat
Administrer flere miljøer med korrekt autentifikation og sikkerhed

---

### Kapitel 4: Infrastruktur som Kode & Udrulning (1-1,5 timer) 🏗️
**Forudsætninger**: Kapitel 1-3 afsluttet  
**Kompleksitet**: ⭐⭐⭐

#### Hvad Du Lærer
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressourceprovisionering
- Oprettelse af brugerdefinerede skabeloner

#### Læringsressourcer
- [Deployment Guide](docs/deployment/deployment-guide.md) - Komplette arbejdsgange
- [Provisioning Resources](docs/deployment/provisioning.md) - Ressourcestyring
- Eksempler på containere og mikrotjenester

#### Praktisk Resultat
Udrul komplekse multi-service applikationer ved hjælp af brugerdefinerede infrastrukturskabeloner

---

### Kapitel 5: Multi-Agent AI Løsninger (2-3 timer) 🤖🤖
**Forudsætninger**: Kapitel 1-2 afsluttet  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad Du Lærer
- Mønstre for multi-agent arkitektur
- Orkestrering og koordinering af agenter
- Produktionsklare AI-udrulninger
- Implementering af kunde- og lageragenter

#### Læringsressourcer
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplet implementering
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klik udrulning
- Koordinationsmønstre for multi-agenter

#### Praktisk Resultat
Udrul og administrer en produktionsklar multi-agent AI-løsning

---

### Kapitel 6: Validering & Planlægning Før Udrulning (1 time) 🔍
**Forudsætninger**: Kapitel 4 afsluttet  
**Kompleksitet**: ⭐⭐

#### Hvad Du Lærer
- Kapacitetsplanlægning og ressourcevalidering
- Strategier for valg af SKU'er
- Pre-flight checks og automatisering
- Planlægning af omkostningsoptimering

#### Læringsressourcer
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Ressourcevalidering
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Omkostningseffektive valg
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktisk Resultat
Valider og optimer udrulninger før eksekvering

---

### Kapitel 7: Fejlfinding & Debugging (1-1,5 timer) 🔧
**Forudsætninger**: Ethvert udrulningskapitel afsluttet  
**Kompleksitet**: ⭐⭐

#### Hvad Du Lærer
- Systematiske fejlsøgningsmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding
- Optimering af ydeevne

#### Læringsressourcer
- [Common Issues](docs/troubleshooting/common-issues.md) - FAQ og løsninger
- [Debugging Guide](docs/troubleshooting/debugging.md) - Trin-for-trin strategier
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktisk Resultat
Diagnostiser og løs almindelige udrulningsproblemer selvstændigt

---

### Kapitel 8: Produktions- & Enterprise Mønstre (2-3 timer) 🏢
**Forudsætninger**: Kapitel 1-4 afsluttet  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad Du Lærer
- Strategier for produktionsudrulning
- Enterprise sikkerhedsmønstre
- Overvågning og omkostningsoptimering
- Skalerbarhed og governance

#### Læringsressourcer
- [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Enterprise mønstre
- Eksempler på mikrotjenester og enterprise løsninger
- Frameworks for overvågning og governance

#### Praktisk Resultat
Udrul enterprise-klare applikationer med fulde produktionsfunktioner

---

## Læringsprogression og Kompleksitet

### Progressiv Kompetenceopbygning

- **🌱 Begyndere**: Start med Kapitel 1 (Grundlag) → Kapitel 2 (AI Udvikling)
- **🔧 Mellemstadie**: Kapitel 3-4 (Konfiguration & Infrastruktur) → Kapitel 6 (Validering)
- **🚀 Avanceret**: Kapitel 5 (Multi-Agent Løsninger) → Kapitel 7 (Fejlfinding)
- **🏢 Enterprise**: Fuldfør alle kapitler, fokusér på Kapitel 8 (Produktionsmønstre)

### Kompleksitetsindikatorer

- **⭐ Grundlæggende**: Enkle koncepter, guidede tutorials, 30-60 minutter
- **⭐⭐ Mellemstadie**: Flere koncepter, praktisk øvelse, 1-2 timer  
- **⭐⭐⭐ Avanceret**: Komplekse arkitekturer, brugerdefinerede løsninger, 1-3 timer
- **⭐⭐⭐⭐ Ekspert**: Produktionssystemer, enterprise mønstre, 2-4 timer

### Fleksible Læringsveje

#### 🎯 AI Udvikler Hurtigspor (4-6 timer)
1. **Kapitel 1**: Grundlag & Hurtig Start (45 min)
2. **Kapitel 2**: AI-Først Udvikling (2 timer)  
3. **Kapitel 5**: Multi-Agent AI Løsninger (3 timer)
4. **Kapitel 8**: Produktions AI Bedste Praksis (1 time)

#### 🛠️ Infrastruktur Specialist Spor (5-7 timer)
1. **Kapitel 1**: Grundlag & Hurtig Start (45 min)
2. **Kapitel 3**: Konfiguration & Autentifikation (1 time)
3. **Kapitel 4**: Infrastruktur som Kode & Udrulning (1,5 timer)
4. **Kapitel 6**: Validering & Planlægning Før Udrulning (1 time)
5. **Kapitel 7**: Fejlfinding & Debugging (1,5 timer)
6. **Kapitel 8**: Produktions- & Enterprise Mønstre (2 timer)

#### 🎓 Komplet Læringsrejse (8-12 timer)
Sekventiel gennemførelse af alle 8 kapitler med praktisk øvelse og validering

## Kursusafslutningsramme

### Videnvalidering
- **Kapitel Checkpoints**: Praktiske øvelser med målbare resultater
- **Praktisk Verifikation**: Udrul fungerende løsninger for hvert kapitel
- **Fremskridtssporing**: Visuelle indikatorer og afslutningsmærker
- **Fællesskabsvalidering**: Del erfaringer i Azure Discord-kanaler

### Læringsresultater Vurdering

#### Kapitel 1-2 Afslutning (Grundlag + AI)
- ✅ Udrul grundlæggende webapplikation ved hjælp af AZD
- ✅ Udrul AI-drevet chatapplikation med RAG
- ✅ Forstå AZD kernekoncepter og AI-integration

#### Kapitel 3-4 Afslutning (Konfiguration + Infrastruktur)  
- ✅ Administrer multi-miljø udrulninger
- ✅ Opret brugerdefinerede Bicep infrastrukturskabeloner
- ✅ Implementer sikre autentifikationsmønstre

#### Kapitel 5-6 Afslutning (Multi-Agent + Validering)
- ✅ Udrul kompleks multi-agent AI-løsning
- ✅ Udfør kapacitetsplanlægning og omkostningsoptimering
- ✅ Implementer automatiseret validering før udrulning

#### Kapitel 7-8 Afslutning (Fejlfinding + Produktion)
- ✅ Fejlfind og løs udrulningsproblemer selvstændigt  
- ✅ Implementer enterprise-grade overvågning og sikkerhed
- ✅ Udrul produktionsklare applikationer med governance

### Certificering og Anerkendelse
- **Kursusafslutningsmærke**: Fuldfør alle 8 kapitler med praktisk validering
- **Fællesskabsanerkendelse**: Aktiv deltagelse i Azure AI Foundry Discord
- **Professionel Udvikling**: Industri-relevante AZD og AI udrulningsfærdigheder
- **Karrierefremme**: Enterprise-klare cloud udrulningskompetencer

## Indholdets Relevans for Moderne Udviklere

### Teknisk Dybde og Dækning
- **Azure OpenAI Integration**: Fuld dækning af GPT-4o, embeddings og multi-model udrulninger
- **AI Arkitektur Mønstre**: RAG-implementeringer, multi-agent orkestrering og produktions AI arbejdsgange
- **Infrastruktur som Kode**: Bicep skabeloner, ARM udrulninger og automatiseret provisionering
- **Produktionsklarhed**: Sikkerhed, skalering, overvågning, omkostningsoptimering og governance
- **Enterprise Mønstre**: Multi-miljø udrulninger, CI/CD integration og compliance frameworks

### Praktisk Læringsfokus
- **Udrulningsautomatisering**: Fokus på praktiske AZD arbejdsgange frem for teoretiske koncepter
- **Virkelighedsnære Scenarier**: Komplet retail multi-agent løsning med kunde- og lageragenter
- **Produktions Eksempler**: ARM skabelonpakker, én-klik udrulninger og enterprise mønstre
- **Fejlfindingsevner**: AI-specifik debugging, multi-service diagnostik og ydeevneoptimering
- **Industri Relevans**: Baseret på feedback fra Azure AI Foundry fællesskabet og enterprise krav

### Fællesskab og Support Integration
- **Discord Integration**: Aktiv deltagelse i Azure AI Foundry og Microsoft Azure fællesskaber
- **GitHub Diskussioner**: Samarbejdslæring og problemløsning med peers og eksperter
- **Ekspertadgang**: Direkte forbindelse til Microsoft ingeniører og AI udrulningsspecialister
- **Løbende Opdateringer**: Kursusindhold udvikler sig med Azure platformopdateringer og fællesskabsfeedback
- **Karriereudvikling**: Færdigheder direkte anvendelige til moderne cloud- og AI-udviklingsroller

### Validering af Læringsresultater
- **Målbare Færdigheder**: Hvert kapitel inkluderer praktiske udrulningsøvelser med verificerbare resultater
- **Porteføljeudvikling**: Komplette projekter egnet til professionelle porteføljer og jobinterviews
- **Industri Anerkendelse**: Færdigheder matcher aktuelle jobmarkedskrav for AZD og AI udrulningsekspertise
- **Professionelt Netværk**: Adgang til Azure udviklerfællesskab for karrierefremme og samarbejde

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.