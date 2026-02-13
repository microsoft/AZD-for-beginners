# AZD For Beginners: Course Outline & Learning Framework

## Course Overview

Master Azure Developer CLI (azd) through structured chapters designed for progressive learning. **Special focus on AI application deployment with Microsoft Foundry integration.**

### Why This Course is Essential for Modern Developers

Based on Microsoft Foundry Discord community insights, **45% of developers want to use AZD for AI workloads** but encounter challenges with:
- Complex multi-service AI architectures
- Production AI deployment best practices  
- Azure AI service integration and configuration
- Cost optimization for AI workloads
- Troubleshooting AI-specific deployment issues

### Core Learning Objectives

By completing this structured course, you will:
- **Master AZD Fundamentals**: Core concepts, installation, and configuration
- **Deploy AI Applications**: Use AZD with Microsoft Foundry services
- **Implement Infrastructure as Code**: Manage Azure resources with Bicep templates
- **Troubleshoot Deployments**: Resolve common issues and debug problems
- **Optimize for Production**: Security, scaling, monitoring, and cost management
- **Build Multi-Agent Solutions**: Deploy complex AI architectures

## 🎓 Workshop Learning Experience

### Flexible Learning Delivery Options
This course is designed to support both **self-paced individual learning** and **facilitated workshop sessions**, enabling learners to get hands-on experience with AZD while developing practical skills through interactive exercises.

#### 🚀 Self-Paced Learning Mode
**Perfect for individual developers and continuous learning**

**Features:**
- **Browser-Based Interface**: Complete MkDocs-powered workshop accessible through any web browser
- **GitHub Codespaces Integration**: One-click development environment with pre-configured tools
- **Interactive DevContainer Environment**: No local setup required - start coding immediately
- **Progress Tracking**: Built-in checkpoints and validation exercises
- **Community Support**: Access to Azure Discord channels for questions and collaboration

**Learning Structure:**
- **Flexible Timing**: Complete chapters at your own pace over days or weeks
- **Checkpoint System**: Validate learning before advancing to complex topics
- **Resource Library**: Comprehensive documentation, examples, and troubleshooting guides
- **Portfolio Development**: Build deployable projects for professional portfolios

**Getting Started (Self-Paced):**
```bash
# Valik 1: GitHub Codespaces (Soovitatav)
# Minge hoidla lehele ja klõpsake "Code" → "Create codespace on main"

# Valik 2: Kohalik arendus
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Järgige seadistamisjuhiseid failis workshop/README.md
```

#### 🏛️ Facilitated Workshop Sessions
**Ideal for corporate training, bootcamps, and educational institutions**

**Workshop Format Options:**

**📚 Academic Course Integration (8-12 weeks)**
- **University Programs**: Semester-long course with weekly 2-hour sessions
- **Bootcamp Format**: Intensive 3-5 day program with daily 6-8 hour sessions
- **Corporate Training**: Monthly team sessions with practical project implementation
- **Assessment Framework**: Graded assignments, peer reviews, and final projects

**🚀 Intensive Workshop (1-3 days)**
- **Day 1**: Foundation + AI Development (Chapters 1-2) - 6 hours
- **Day 2**: Configuration + Infrastructure (Chapters 3-4) - 6 hours  
- **Day 3**: Advanced Patterns + Production (Chapters 5-8) - 8 hours
- **Follow-up**: Optional 2-week mentorship for project completion

**⚡ Executive Briefing (4-6 hours)**
- **Strategic Overview**: AZD value proposition and business impact (1 hour)
- **Hands-On Demo**: Deploy AI application end-to-end (2 hours)
- **Architecture Review**: Enterprise patterns and governance (1 hour)
- **Implementation Planning**: Organizational adoption strategy (1-2 hours)

#### 🛠️ Workshop Learning Methodology
**Discovery → Deployment → Customization approach for hands-on skill development**

**Phase 1: Discovery (45 minutes)**
- **Template Exploration**: Evaluate Microsoft Foundry templates and services
- **Architecture Analysis**: Understand multi-agent patterns and deployment strategies
- **Requirement Assessment**: Identify organizational needs and constraints
- **Environment Setup**: Configure development environment and Azure resources

**Phase 2: Deployment (2 hours)**
- **Guided Implementation**: Step-by-step deployment of AI applications with AZD
- **Service Configuration**: Configure Azure AI services, endpoints, and authentication
- **Security Implementation**: Apply enterprise security patterns and access controls
- **Validation Testing**: Verify deployments and troubleshoot common issues

**Phase 3: Customization (45 minutes)**
- **Application Modification**: Adapt templates for specific use cases and requirements
- **Production Optimization**: Implement monitoring, cost management, and scaling strategies
- **Advanced Patterns**: Explore multi-agent coordination and complex architectures
- **Next Steps Planning**: Define learning path for continued skill development

#### 🎯 Workshop Learning Outcomes
**Measurable skills developed through hands-on practice**

**Technical Competencies:**
- **Deploy Production AI Applications**: Successfully deploy and configure AI-powered solutions
- **Infrastructure as Code Mastery**: Create and manage custom Bicep templates
- **Multi-Agent Architecture**: Implement coordinated AI agent solutions
- **Production Readiness**: Apply security, monitoring, and governance patterns
- **Troubleshooting Expertise**: Independently resolve deployment and configuration issues

**Professional Skills:**
- **Project Leadership**: Lead technical teams in cloud deployment initiatives
- **Architecture Design**: Design scalable, cost-effective Azure solutions
- **Knowledge Transfer**: Train and mentor colleagues in AZD best practices
- **Strategic Planning**: Influence organizational cloud adoption strategies

#### 📋 Workshop Resources and Materials
**Comprehensive toolkit for facilitators and learners**

**For Facilitators:**
- **Instructor Guide**: [Workshop Overview](workshop/README.md) - Session planning and delivery guidance
- **Presentation Materials**: Slide decks, architecture diagrams, and demo scripts
- **Assessment Tools**: Practical exercises, knowledge checks, and evaluation rubrics
- **Technical Setup**: Environment configuration, troubleshooting guides, and backup plans

**For Learners:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based learning platform
- **Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed implementation walkthroughs  
- **Reference Documentation**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-focused deep dives
- **Community Resources**: Azure Discord channels, GitHub discussions, and expert support

#### 🏢 Enterprise Workshop Implementation
**Organizational deployment and training strategies**

**Corporate Training Programs:**
- **Developer Onboarding**: New hire orientation with AZD fundamentals (2-4 weeks)
- **Team Upskilling**: Quarterly workshops for existing development teams (1-2 days)
- **Architecture Review**: Monthly sessions for senior engineers and architects (4 hours)
- **Leadership Briefings**: Executive workshops for technical decision makers (half-day)

**Implementation Support:**
- **Custom Workshop Design**: Tailored content for specific organizational needs
- **Pilot Program Management**: Structured rollout with success metrics and feedback loops  
- **Ongoing Mentorship**: Post-workshop support for project implementation
- **Community Building**: Internal Azure AI developer communities and knowledge sharing

**Success Metrics:**
- **Skill Acquisition**: Pre/post assessments measuring technical competency growth
- **Deployment Success**: Percentage of participants successfully deploying production applications
- **Time to Productivity**: Reduced onboarding time for new Azure AI projects
- **Knowledge Retention**: Follow-up assessments 3-6 months post-workshop

## 8-Chapter Learning Structure

### Chapter 1: Foundation & Quick Start (30-45 minutes) 🌱
**Prerequisites**: Azure subscription, basic command line knowledge  
**Complexity**: ⭐

#### What You'll Learn
- Understanding Azure Developer CLI fundamentals
- Installing AZD on your platform  
- Your first successful deployment
- Core concepts and terminology

#### Learning Resources
- [AZD Basics](docs/getting-started/azd-basics.md) - Core concepts
- [Installation & Setup](docs/getting-started/installation.md) - Platform-specific guides
- [Your First Project](docs/getting-started/first-project.md) - Hands-on tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Quick reference

#### Practical Outcome
Successfully deploy a simple web application to Azure using AZD

---

### Chapter 2: AI-First Development (1-2 hours) 🤖
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Microsoft Foundry integration with AZD
- Deploying AI-powered applications
- Understanding AI service configurations
- RAG (Retrieval-Augmented Generation) patterns

#### Learning Resources
- [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md)
- [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - **NEW**: Comprehensive 2-3 hour hands-on lab
- [Interactive Workshop Guide](workshop/README.md) - **NEW**: Browser-based workshop with MkDocs preview
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **NEW**: Step-by-step guided exercises

#### Practical Outcome
Deploy and configure an AI-powered chat application with RAG capabilities

#### Workshop Learning Path (Optional Enhancement)
**NEW Interactive Experience**: [Complete Workshop Guide](workshop/README.md)
1. **Discovery** (30 mins): Template selection and evaluation
2. **Deployment** (45 mins): Deploy and validate AI template functionality  
3. **Deconstruction** (30 mins): Understand template architecture and components
4. **Configuration** (30 mins): Customize settings and parameters
5. **Customization** (45 mins): Modify and iterate to make it yours
6. **Teardown** (15 mins): Clean up resources and understand lifecycle
7. **Wrap-up** (15 mins): Next steps and advanced learning paths

---

### Chapter 3: Configuration & Authentication (45-60 minutes) ⚙️
**Prerequisites**: Chapter 1 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Environment configuration and management
- Authentication and security best practices
- Resource naming and organization
- Multi-environment deployments

#### Learning Resources
- [Configuration Guide](docs/getting-started/configuration.md) - Environment setup
- [Authentication & Security Patterns](docs/getting-started/authsecurity.md) - Managed identity and Key Vault integration
- Multi-environment examples

#### Practical Outcome
Manage multiple environments with proper authentication and security

---

### Chapter 4: Infrastructure as Code & Deployment (1-1.5 hours) 🏗️
**Prerequisites**: Chapters 1-3 completed  
**Complexity**: ⭐⭐⭐

#### What You'll Learn
- Advanced deployment patterns
- Infrastructure as Code with Bicep
- Resource provisioning strategies
- Custom template creation

- Containerized application deployment with Azure Container Apps and AZD

#### Learning Resources
- [Deployment Guide](docs/deployment/deployment-guide.md) - Complete workflows
- [Provisioning Resources](docs/deployment/provisioning.md) - Resource management
- Container and microservices examples
- [Container App Examples](examples/container-app/README.md) - Quick start, production, and advanced deployment patterns

#### Practical Outcome
Deploy complex multi-service applications using custom infrastructure templates

---

### Chapter 5: Multi-Agent AI Solutions (2-3 hours) 🤖🤖
**Prerequisites**: Chapters 1-2 completed  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments
- Customer and Inventory agent implementations

- Integrating containerized microservices as part of agent-based solutions

#### Learning Resources
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- Multi-agent coordination patterns
- [Microservices Architecture Example](../../examples/container-app/microservices) - Service-to-service communication, async messaging, and production deployment

#### Practical Outcome
Deploy and manage a production-ready multi-agent AI solution

---

### Chapter 6: Pre-Deployment Validation & Planning (1 hour) 🔍
**Prerequisites**: Chapter 4 completed  
**Complexity**: ⭐⭐

#### What You'll Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation
- Cost optimization planning

#### Learning Resources
- [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts
- [Application Insights Integration](docs/pre-deployment/application-insights.md) - Monitoring and observability
- [Multi-Agent Coordination Patterns](docs/pre-deployment/coordination-patterns.md) - Agent orchestration strategies

#### Practical Outcome
Validate and optimize deployments before execution

---

### Peatükk 7: Tõrkeotsing ja silumine (1–1.5 tundi) 🔧
**Eeldused**: mis tahes juurutamise peatükk lõpetatud  
**Kompleksus**: ⭐⭐

#### Mida õpid
- Süsteemsed tõrkeotsingu lähenemised
- Levinud probleemid ja lahendused
- Tehisintellektile suunatud tõrkeotsing
- Jõudluse optimeerimine

#### Õppematerjalid
- [Common Issues](docs/troubleshooting/common-issues.md) - KKK ja lahendused
- [Debugging Guide](docs/troubleshooting/debugging.md) - Samm-sammult strateegiad
- [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Tehisintellekti teenuste probleemid

#### Praktiline tulemus
Iseseisvalt diagnoosida ja lahendada levinud juurutamisprobleeme

---

### Peatükk 8: Tootmis- ja ettevõtte mustrid (2–3 tundi) 🏢
**Eeldused**: Peatükid 1–4 lõpetatud  
**Kompleksus**: ⭐⭐⭐⭐

#### Mida õpid
- Tootmisse juurutamise strateegiad
- Ettevõtte turvemustrid
- Jälgimine ja kulude optimeerimine
- Skaalautuvus ja haldus

- Parimad tavad tootmiskeskkonna konteinerirakenduste juurutamiseks (turvalisus, jälgimine, kulud, CI/CD)

#### Õppematerjalid
- [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Ettevõtte mustrid
- Mikroteenused ja ettevõtte näited
- Jälgimise ja juhtimise raamistikud
- [Microservices Architecture Example](../../examples/container-app/microservices) - Blue-green/canary juurutamine, hajutatud jälgimine ja kulude optimeerimine

#### Praktiline tulemus
Juurutada ettevõttevalmis rakendusi täis tootmisvõimekusega

---

## Õppimise edenemine ja keerukus

### Oskuste järkjärguline arendamine

- **🌱 Algajad**: Alusta peatükist 1 (Alus) → Peatükk 2 (AI-arendus)
- **🔧 Kesktase**: Peatükid 3–4 (Konfiguratsioon & Infrastruktuur) → Peatükk 6 (Valideerimine)
- **🚀 Edasijõudnud**: Peatükk 5 (Mitmeagendi lahendused) → Peatükk 7 (Tõrkeotsing)
- **🏢 Ettevõtte tase**: Lõpeta kõik peatükid, keskendu peatükile 8 (Tootmis- ja ettevõttemustrid)

- **Konteinerirakenduse rada**: Peatükid 4 (Konteineriseeritud juurutamine), 5 (Mikroteenuste integratsioon), 8 (Tootmise parimad tavad)

### Keerukuse näitajad

- **⭐ Põhiline**: Üksikud kontseptsioonid, juhendatud õppetunnid, 30–60 minutit
- **⭐⭐ Kesktase**: Mitmed kontseptsioonid, praktiline töö, 1–2 tundi  
- **⭐⭐⭐ Edasijõudnud**: Komplekssed arhitektuurid, kohandatud lahendused, 1–3 tundi
- **⭐⭐⭐⭐ Ekspert**: Tootmissüsteemid, ettevõtte mustrid, 2–4 tundi

### Paindlikud õpperajad

#### 🎯 AI arendaja kiirtee (4–6 tundi)
1. **Peatükk 1**: Alus & Kiire algus (45 min)
2. **Peatükk 2**: AI-esmane arendus (2 tundi)  
3. **Peatükk 5**: Mitmeagendi AI lahendused (3 tundi)
4. **Peatükk 8**: Tootmise AI parimad tavad (1 tund)

#### 🛠️ Infrastruktuuri spetsialisti rada (5–7 tundi)
1. **Peatükk 1**: Alus & Kiire algus (45 min)
2. **Peatükk 3**: Konfiguratsioon & Autentimine (1 tund)
3. **Peatükk 4**: Infrastruktuur koodina & Juurutamine (1.5 tundi)
4. **Peatükk 6**: Eeljuurutuse valideerimine & planeerimine (1 tund)
5. **Peatükk 7**: Tõrkeotsing & silumine (1.5 tundi)
6. **Peatükk 8**: Tootmis- ja ettevõtte mustrid (2 tundi)

#### 🎓 Täielik õpperännak (8–12 tundi)
Kõigi 8 peatüki järjestikune läbimine koos praktilise harjutusega ja valideerimisega

## Kursuse lõpetamise raamistik

### Teadmiste valideerimine
- **Peatükkide kontrollpunktid**: Praktilised harjutused mõõdetavate tulemustega
- **Praktiline verifitseerimine**: Juuruta töötavaid lahendusi iga peatüki jaoks
- **Edenemise jälgimine**: Visuaalsed indikaatorid ja lõpetamise märgid
- **Kogukonna valideerimine**: Jaga kogemusi Azure'i Discordi kanalites

### Õppe tulemuste hindamine

#### Peatükk 1–2 lõpetamine (Põhi + AI)
- ✅ Paigalda lihtne veebirakendus AZD abil
- ✅ Paigalda AI-toega vestlusrakendus RAG abil
- ✅ Mõista AZD põhimõisteid ja AI integratsiooni

#### Peatükk 3–4 lõpetamine (Konfiguratsioon + Infrastruktuur)  
- ✅ Halda mitmekesiseid keskkondi (dev, staging, production)
- ✅ Loo kohandatud Bicep infrastruktuuri mallid
- ✅ Rakenda turvalised autentimismustrid

#### Peatükk 5–6 lõpetamine (Mitmeagendi + Valideerimine)
- ✅ Juuruta keerukas mitmeagendi AI lahendus
- ✅ Teosta koormusplaneerimist ja kulude optimeerimist
- ✅ Rakenda automatiseeritud eeljuurutuse valideerimine

#### Peatükk 7–8 lõpetamine (Tõrkeotsing + Tootmine)
- ✅ Silu ja lahenda juurutamisprobleeme iseseisvalt  
- ✅ Rakenda ettevõtte tasemel jälgimist ja turvalisust
- ✅ Juuruta tootmiskõlblikke rakendusi valitsemisega

### Sertifitseerimine ja tunnustus
- **Kursuse lõpetamise märk**: Lõpeta kõik 8 peatükki praktilise valideerimisega
- **Kogukonna tunnustus**: Aktiivne osalus Microsoft Foundry Discordis
- **Ametialane areng**: Tööstusharu asjakohased AZD ja AI juurutamise oskused
- **Karjääri edendamine**: Ettevõttevalmidusega pilvejuurutamise võimekused

## 🎓 Põhjalikud õpiväljundid

### Põhitaseme (Peatükid 1–2)
Põhialaste peatükkide lõpetamisel õpilased demonstreerivad:

**Tehnilised võimed:**
- Juurutada lihtsaid veebirakendusi Azure'i AZD käskudega
- Konfigureerida ja juurutada AI-toega vestlusrakendusi RAG võimekusega
- Mõista AZD põhikontseptsioone: mallid, keskkonnad, provisioneerimise töövood
- Integreerida Microsoft Foundry teenuseid AZD juurutustega
- Navigeerida Azure AI teenuste konfiguratsioonides ja API otspunktides

**Ametialased oskused:**
- Järgida struktureeritud juurutamise töövooge järjepidevate tulemuste saavutamiseks
- Tõrkeotsing põhijuhtude korral logide ja dokumentatsiooni abil
- Suhelda tõhusalt pilvejuurutuse protsessidest
- Rakendada parimaid tavasid turvalise AI teenuste integratsiooni jaoks

**Õppe valideerimine:**
- ✅ Edukalt juuruta `todo-nodejs-mongo` mall
- ✅ Juuruta ja konfigureeri `azure-search-openai-demo` RAG abil
- ✅ Lõpeta interaktiivsed töötoa harjutused (Discovery faas)
- ✅ Osale Azure Discordi kogukonna aruteludes

### Kesktase (Peatükid 3–4)
Kesktasemel lõpetamisel õpilased demonstreerivad:

**Tehnilised võimed:**
- Halda mitmekesiseid keskkondade juurutusi (dev, staging, production)
- Loo kohandatud Bicep mallid infrastruktuuri koodina
- Rakenda turvalisi autentimismustreid hallatud identiteediga
- Juuruta keerukaid mitme-teenuse rakendusi kohandatud konfiguratsioonidega
- Optimeeri ressursside provisioneerimise strateegiaid kulude ja jõudluse jaoks

**Ametialased oskused:**
- Kujunda skaleeritavaid infrastruktuuri arhitektuure
- Rakenda turbe parimaid tavasid pilvejuurutuste jaoks
- Dokumenteeri infrastruktuuri mustrid meeskonna koostööks
- Hinda ja vali asjakohased Azure teenused nõuete täitmiseks

**Õppe valideerimine:**
- ✅ Konfigureeri eraldi keskkonnad keskkonnapõhiste sätetega
- ✅ Loo ja juuruta kohandatud Bicep mall mitme-teenuse rakenduse jaoks
- ✅ Rakenda hallatud identiteediga autentimine turvaliseks ligipääsuks
- ✅ Lõpeta konfiguratsioonihalduse harjutused reaalse olukorraga

### Edasijõudnud tase (Peatükid 5–6)
Edasijõudnutele lõpetamisel õpilased demonstreerivad:

**Tehnilised võimed:**
- Juurutada ja orkestreerida mitmeagendi AI lahendusi koordineeritud töövoogudega
- Rakendada kliendi- ja laoseisu agentide arhitektuure jaekaubanduse stsenaariumites
- Teostada põhjalikku koormusplaneerimist ja ressursside valideerimist
- Käivitada automatiseeritud eeljuurutuse valideerimine ja optimeerimine
- Kujundada kulutõhusaid SKU valikuid töökoormuse nõuete põhjal

**Ametialased oskused:**
- Arhitektuuri kujundamine keerukate AI lahenduste jaoks tootmiskeskkondades
- Juhtida tehnilisi arutelusid AI juurutamise strateegiatest
- Mentorlus noorematele arendajatele AZD ja AI juurutamise parimates tavadest
- Hinnata ja soovitada AI arhitektuuri mustreid ärivajaduste jaoks

**Õppe valideerimine:**
- ✅ Juuruta täielik jaekaubanduse mitmeagendi lahendus ARM mallidega
- ✅ Demonstreeri agentide koordinatsiooni ja töövoo orkestreerimist
- ✅ Täida koormusplaneerimise harjutused reaalse ressursside piiranguga
- ✅ Valideeri juurutuse valmisolek automatiseeritud eelkontrollidega

### Ekspert tase (Peatükid 7–8)
Ekspertluse tasemel lõpetamisel õpilased demonstreerivad:

**Tehnilised võimed:**
- Diagnoosida ja lahendada keerukaid juurutamisprobleeme iseseisvalt
- Rakendada ettevõtte tasemel turbemustreid ja juhtimisraamistikke
- Kujundada terviklikud jälgimise ja häirestrateegiad
- Optimeerida tootmisse juurutusi skaala, kulu ja jõudluse osas
- Luuа CI/CD torustikud sobiva testimise ja valideerimisega

**Ametialased oskused:**
- Juhtida ettevõtte pilve transformatsiooni algatusi
- Kujundada ja rakendada organisatsioonilisi juurutamisstandardeid
- Koolitada ja juhendada arendusmeeskondi täiustatud AZD praktikates
- Mõjutada tehnilisi otsuseid ettevõtte AI juurutuste kontekstis

**Õppe valideerimine:**
- ✅ Lahenda keerukaid mitme-teenuse juurutamise tõrkeid
- ✅ Rakenda ettevõtte turbemustreid vastavusnõuetega
- ✅ Kujunda ja juuruta tootmisse jälgimine Application Insights abil
- ✅ Täida ettevõtte juhtimisraamistiku rakendamine

## 🎯 Kursuse lõpetamise sertifikaat

### Edenemise jälgimise raamistik
Track your learning progress through structured checkpoints:

- [ ] **Peatükk 1**: Alus & Kiire algus ✅
- [ ] **Peatükk 2**: AI-esmane arendus ✅  
- [ ] **Peatükk 3**: Konfiguratsioon & Autentimine ✅
- [ ] **Peatükk 4**: Infrastruktuur koodina & Juurutamine ✅
- [ ] **Peatükk 5**: Mitmeagendi AI lahendused ✅
- [ ] **Peatükk 6**: Eeljuurutuse valideerimine & planeerimine ✅
- [ ] **Peatükk 7**: Tõrkeotsing & silumine ✅
- [ ] **Peatükk 8**: Tootmis- ja ettevõtte mustrid ✅

### Verifitseerimise protsess
Pärast iga peatüki lõpetamist kinnita oma teadmised läbi:

1. **Praktilise harjutuse lõpetamine**: Juuruta töötavad lahendused iga peatüki kohta
2. **Teadmiste hindamine**: Vaata KKK ja täida enesehindamised
3. **Kogukonna kaasatus**: Jaga kogemusi ja saa tagasisidet Azure'i Discordis
4. **Portfoolio loomine**: Dokumenteeri oma juurutused ja õppetunnid
5. **Eakaaslaste ülevaatus**: Tee koostööd teiste õppijatega keerukates stsenaariumites

### Kursuse lõpetamise eelised
Pärast kõigi peatükkide lõpetamist valideerimisega on lõpetanutel:

**Tehniline ekspertteadmised:**
- **Tootmiskogemus**: Juurutatud tõelisi AI rakendusi Azure keskkondadesse
- **Ametialased oskused**: Ettevõttevalmidusega juurutamise ja tõrkeotsingu võimed  
- **Arhitektuuriteadmised**: Mitmeagendi AI lahendused ja keerukad infrastruktuurimustrid
- **Tõrkeotsingu meisterlikkus**: Iseseisev juurutamise ja konfiguratsiooni probleemide lahendamine

**Ametialane areng:**
- **Tööstuse tunnustus**: Kontrollitavad oskused nõutud AZD ja AI juurutamise valdkondades
- **Karjääri areng**: Sobiv kvalifikatsioon pilvearhitekti ja AI juurutamise spetsialisti rollideks
- **Kogukonna juhtimine**: Aktiivne kuulumine Azure arendaja- ja AI kogukondadesse
- **Jätkuõpe**: Alus edasise Microsoft Foundry spetsialiseerumise jaoks

**Portfoolio varad:**
- **Juurutatud lahendused**: Töötavad näited AI rakendustest ja infrastruktuuri mustritest
- **Dokumentatsioon**: Põhjalikud juurutusjuhendid ja tõrkeotsingu protseduurid  
- **Kogukonna panused**: Arutelud, näited ja täiustused, mida jagatud Azure kogukonnaga
- **Ametialane võrgustik**: Kontaktid Azure ekspertide ja AI juurutamise praktikute seas

### Pärastkursuse õpperada
Lõpetajad on valmis edasiseks spetsialiseerumiseks:
- **Microsoft Foundry ekspert**: Süva spetsialiseerumine AI mudelite juurutamisse ja orkestreerimisse
- **Pilve arhitektuuri juhtimine**: Ettevõtte tasemel juurutuste kujundamine ja juhtimine
- **Arendajate kogukonna juhtimine**: Panustamine Azure näidete ja kogukonna ressursside arendamisse
- **Ettevõttekoolitus**: AZD ja AI juurutamise oskuste õpetamine organisatsioonides
    



---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Lahtiütlus:
See dokument on tõlgitud tehisintellekti-põhise tõlketeenuse Co-op Translator abil (https://github.com/Azure/co-op-translator). Kuigi püüame tagada täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega valesti tõlgendamise eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->