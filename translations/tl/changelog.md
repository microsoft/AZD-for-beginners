# Changelog - AZD Para sa Mga Baguhan

## Panimula

Ang changelog na ito ay nagdodokumento ng lahat ng mahahalagang pagbabago, update, at pagpapabuti sa repository ng AZD Para sa Mga Baguhan. Sinusunod namin ang mga prinsipyo ng semantic versioning at pinapanatili ang log na ito upang matulungan ang mga user na maunawaan ang mga pagbabago sa pagitan ng mga bersyon.

## Mga Layunin sa Pag-aaral

Sa pag-review ng changelog na ito, ikaw ay:
- Mananatiling updated sa mga bagong feature at karagdagang nilalaman
- Mauunawaan ang mga pagpapabuti sa kasalukuyang dokumentasyon
- Masusubaybayan ang mga pag-aayos ng bug at mga koreksyon para sa mas tumpak na impormasyon
- Masusundan ang ebolusyon ng mga materyales sa pag-aaral sa paglipas ng panahon

## Mga Resulta ng Pag-aaral

Pagkatapos i-review ang mga entry sa changelog, magagawa mong:
- Tukuyin ang mga bagong nilalaman at resources para sa pag-aaral
- Mauunawaan kung aling mga seksyon ang na-update o napabuti
- Magplano ng iyong landas sa pag-aaral batay sa pinakabagong materyales
- Magbigay ng feedback at mga suhestiyon para sa mga susunod na pagpapabuti

## Kasaysayan ng Bersyon

### [v3.8.0] - 2025-11-19

#### Advanced na Dokumentasyon: Monitoring, Security, at Multi-Agent Patterns
**Ang bersyong ito ay nagdadagdag ng komprehensibong A-grade na mga aralin sa Application Insights integration, authentication patterns, at multi-agent coordination para sa production deployments.**

#### Idinagdag
- **📊 Application Insights Integration Lesson**: sa `docs/pre-deployment/application-insights.md`:
  - Deployment na nakatuon sa AZD na may automatic provisioning
  - Kumpletong Bicep templates para sa Application Insights + Log Analytics
  - Gumaganang Python applications na may custom telemetry (1,200+ linya)
  - AI/LLM monitoring patterns (Azure OpenAI token/cost tracking)
  - 6 Mermaid diagrams (architecture, distributed tracing, telemetry flow)
  - 3 hands-on exercises (alerts, dashboards, AI monitoring)
  - Mga halimbawa ng Kusto query at mga estratehiya sa cost optimization
  - Live metrics streaming at real-time debugging
  - 40-50 minutong oras ng pag-aaral na may production-ready patterns

- **🔐 Authentication & Security Patterns Lesson**: sa `docs/getting-started/authsecurity.md`:
  - 3 authentication patterns (connection strings, Key Vault, managed identity)
  - Kumpletong Bicep infrastructure templates para sa secure deployments
  - Node.js application code na may Azure SDK integration
  - 3 kumpletong exercises (enable managed identity, user-assigned identity, Key Vault rotation)
  - Mga best practices sa security at RBAC configurations
  - Troubleshooting guide at cost analysis
  - Production-ready passwordless authentication patterns

- **🤖 Multi-Agent Coordination Patterns Lesson**: sa `docs/pre-deployment/coordination-patterns.md`:
  - 5 coordination patterns (sequential, parallel, hierarchical, event-driven, consensus)
  - Kumpletong orchestrator service implementation (Python/Flask, 1,500+ linya)
  - 3 specialized agent implementations (Research, Writer, Editor)
  - Service Bus integration para sa message queuing
  - Cosmos DB state management para sa distributed systems
  - 6 Mermaid diagrams na nagpapakita ng agent interactions
  - 3 advanced exercises (timeout handling, retry logic, circuit breaker)
  - Cost breakdown ($240-565/buwan) na may optimization strategies
  - Application Insights integration para sa monitoring

#### Pinahusay
- **Pre-deployment Chapter**: Ngayon ay may kasamang komprehensibong monitoring at coordination patterns
- **Getting Started Chapter**: Pinahusay na may mga propesyonal na authentication patterns
- **Production Readiness**: Kumpletong coverage mula sa security hanggang sa observability
- **Course Outline**: Na-update upang i-refer ang mga bagong aralin sa Chapters 3 at 6

#### Binago
- **Learning Progression**: Mas mahusay na integration ng security at monitoring sa buong kurso
- **Documentation Quality**: Konsistent na A-grade standards (95-97%) sa mga bagong aralin
- **Production Patterns**: Kumpletong end-to-end coverage para sa enterprise deployments

#### Pinabuti
- **Developer Experience**: Malinaw na landas mula sa development hanggang sa production monitoring
- **Security Standards**: Propesyonal na patterns para sa authentication at secrets management
- **Observability**: Kumpletong Application Insights integration sa AZD
- **AI Workloads**: Specialized monitoring para sa Azure OpenAI at multi-agent systems

#### Na-validate
- ✅ Lahat ng aralin ay may kumpletong gumaganang code (hindi snippets)
- ✅ Mermaid diagrams para sa visual learning (19 kabuuan sa 3 aralin)
- ✅ Hands-on exercises na may verification steps (9 kabuuan)
- ✅ Production-ready Bicep templates na ma-deploy gamit ang `azd up`
- ✅ Cost analysis at optimization strategies
- ✅ Troubleshooting guides at best practices
- ✅ Knowledge checkpoints na may verification commands

#### Mga Resulta ng Grading ng Dokumentasyon
- **docs/pre-deployment/application-insights.md**: - Komprehensibong monitoring guide
- **docs/getting-started/authsecurity.md**: - Propesyonal na security patterns
- **docs/pre-deployment/coordination-patterns.md**: - Advanced na multi-agent architectures
- **Kabuuang Bagong Nilalaman**: - Konsistent na mataas na kalidad na standards

#### Teknikal na Implementasyon
- **Application Insights**: Log Analytics + custom telemetry + distributed tracing
- **Authentication**: Managed Identity + Key Vault + RBAC patterns
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Live metrics + Kusto queries + alerts + dashboards
- **Cost Management**: Sampling strategies, retention policies, budget controls

### [v3.7.0] - 2025-11-19

#### Mga Pagpapabuti sa Kalidad ng Dokumentasyon at Bagong Azure OpenAI Example
**Ang bersyong ito ay nagpapahusay sa kalidad ng dokumentasyon sa buong repository at nagdadagdag ng kumpletong Azure OpenAI deployment example na may GPT-4 chat interface.**

#### Idinagdag
- **🤖 Azure OpenAI Chat Example**: Kumpletong GPT-4 deployment na may gumaganang implementation sa `examples/azure-openai-chat/`:
  - Kumpletong Azure OpenAI infrastructure (GPT-4 model deployment)
  - Python command-line chat interface na may conversation history
  - Key Vault integration para sa secure API key storage
  - Token usage tracking at cost estimation
  - Rate limiting at error handling
  - Komprehensibong README na may 35-45 minutong deployment guide
  - 11 production-ready files (Bicep templates, Python app, configuration)
- **📚 Documentation Exercises**: Idinagdag ang hands-on practice exercises sa configuration guide:
  - Exercise 1: Multi-environment configuration (15 minuto)
  - Exercise 2: Secret management practice (10 minuto)
  - Malinaw na success criteria at verification steps
- **✅ Deployment Verification**: Idinagdag ang verification section sa deployment guide:
  - Mga health check procedures
  - Success criteria checklist
  - Expected outputs para sa lahat ng deployment commands
  - Troubleshooting quick reference

#### Pinahusay
- **examples/README.md**: Na-update sa A-grade quality (93%):
  - Idinagdag ang azure-openai-chat sa lahat ng kaugnay na seksyon
  - Na-update ang bilang ng local example mula 3 hanggang 4
  - Idinagdag sa AI Application Examples table
  - Isinama sa Quick Start para sa Intermediate Users
  - Idinagdag sa Azure AI Foundry Templates section
  - Na-update ang Comparison Matrix at technology finding sections
- **Kalidad ng Dokumentasyon**: Pinahusay mula B+ (87%) → A- (92%) sa buong docs folder:
  - Idinagdag ang expected outputs sa mga critical command examples
  - Isinama ang verification steps para sa mga pagbabago sa configuration
  - Pinahusay ang hands-on learning gamit ang practical exercises

#### Binago
- **Learning Progression**: Mas mahusay na integration ng AI examples para sa intermediate learners
- **Struktura ng Dokumentasyon**: Mas actionable na exercises na may malinaw na outcomes
- **Verification Process**: Idinagdag ang explicit success criteria sa mga key workflows

#### Pinabuti
- **Developer Experience**: Ang Azure OpenAI deployment ngayon ay tumatagal ng 35-45 minuto (kumpara sa 60-90 para sa mas komplikadong alternatibo)
- **Cost Transparency**: Malinaw na cost estimates ($50-200/buwan) para sa Azure OpenAI example
- **Learning Path**: Ang mga AI developer ay may malinaw na entry point gamit ang azure-openai-chat
- **Documentation Standards**: Konsistent na expected outputs at verification steps

#### Na-validate
- ✅ Ang Azure OpenAI example ay ganap na gumagana gamit ang `azd up`
- ✅ Lahat ng 11 implementation files ay syntactically correct
- ✅ Ang README instructions ay tumutugma sa aktwal na deployment experience
- ✅ Ang mga dokumentasyon links ay na-update sa 8+ na lokasyon
- ✅ Ang index ng mga halimbawa ay tumpak na sumasalamin sa 4 na local examples
- ✅ Walang duplicate na external links sa mga tables
- ✅ Lahat ng navigation references ay tama

#### Teknikal na Implementasyon
- **Azure OpenAI Architecture**: GPT-4 + Key Vault + Container Apps pattern
- **Security**: Managed Identity ready, secrets sa Key Vault
- **Monitoring**: Application Insights integration
- **Cost Management**: Token tracking at usage optimization
- **Deployment**: Single `azd up` command para sa kumpletong setup

### [v3.6.0] - 2025-11-19

#### Major Update: Mga Halimbawa ng Container App Deployment
**Ang bersyong ito ay nagpapakilala ng komprehensibo, production-ready na mga halimbawa ng container application deployment gamit ang Azure Developer CLI (AZD), na may kumpletong dokumentasyon at integration sa learning path.**

#### Idinagdag
- **🚀 Mga Halimbawa ng Container App**: Bagong local examples sa `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Kumpletong overview ng containerized deployments, quick start, production, at advanced patterns
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Beginner-friendly REST API na may scale-to-zero, health probes, monitoring, at troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Production-ready multi-service deployment (API Gateway, Product, Order, User, Notification), async messaging, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Best Practices**: Security, monitoring, cost optimization, at CI/CD guidance para sa containerized workloads
- **Code Samples**: Kumpletong `azure.yaml`, Bicep templates, at multi-language service implementations (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end test scenarios, monitoring commands, troubleshooting guidance

#### Binago
- **README.md**: Na-update upang i-feature at i-link ang mga bagong halimbawa ng container app sa ilalim ng "Local Examples - Container Applications"
- **examples/README.md**: Na-update upang i-highlight ang mga halimbawa ng container app, magdagdag ng comparison matrix entries, at i-update ang technology/architecture references
- **Course Outline & Study Guide**: Na-update upang i-refer ang mga bagong halimbawa ng container app at deployment patterns sa mga kaugnay na chapters

#### Na-validate
- ✅ Lahat ng bagong halimbawa ay ma-deploy gamit ang `azd up` at sumusunod sa best practices
- ✅ Ang mga cross-links ng dokumentasyon at navigation ay na-update
- ✅ Ang mga halimbawa ay sumasaklaw mula beginner hanggang advanced scenarios, kabilang ang production microservices

#### Mga Tala
- **Saklaw**: English documentation at examples lamang
- **Susunod na Hakbang**: Palawakin gamit ang karagdagang advanced container patterns at CI/CD automation sa mga susunod na release

### [v3.5.0] - 2025-11-19

#### Pag-rebrand ng Produkto: Microsoft Foundry
**Ang bersyong ito ay nagpatupad ng komprehensibong pagbabago sa pangalan ng produkto mula "Azure AI Foundry" patungong "Microsoft Foundry" sa lahat ng English documentation, na sumasalamin sa opisyal na rebranding ng Microsoft.**

#### Binago
- **🔄 Pag-update ng Pangalan ng Produkto**: Kumpletong rebranding mula "Azure AI Foundry" patungong "Microsoft Foundry"
  - Na-update ang lahat ng references sa English documentation sa `docs/` folder
  - Pinalitan ang pangalan ng folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Pinalitan ang pangalan ng file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Kabuuan: 23 content references na na-update sa 7 documentation files

- **📁 Mga Pagbabago sa Struktura ng Folder**:
  - `docs/ai-foundry/` pinalitan ng pangalan sa `docs/microsoft-foundry/`
  - Lahat ng cross-references ay na-update upang sumalamin sa bagong struktura ng folder
  - Ang mga navigation links ay na-validate sa lahat ng dokumentasyon

- **📄 Mga Pagpapalit ng File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Lahat ng internal links ay na-update upang i-refer ang bagong filename

#### Na-update na Mga File
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigation link updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 product name references updated
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Nauna nang gumagamit ng Microsoft Foundry (mula sa mga nakaraang update)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 references updated (overview, community feedback, documentation)
  - `docs/getting-started/azd-basics.md` - 4 cross-reference links updated
  - `docs/getting-started/first-project.md` - 2 chapter navigation links updated
  - `docs/getting-started/installation.md` - 2 next chapter links updated
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 references updated (navigation, Discord community)
  - `docs/troubleshooting/common-issues.md` - 1 navigation link updated
  - `docs/troubleshooting/debugging.md` - 1 navigation link updated

- **Course Structure Files** (2 files):
  - `README.md` - 17 references updated (course overview, chapter titles, templates section, community insights)
  - `course-outline.md` - 14 references updated (overview, learning objectives, chapter resources)

#### Na-validate
- ✅ Walang natitirang "ai-foundry" folder path references sa English docs
- ✅ Walang natitirang "Azure AI Foundry" product name references sa English docs
- ✅ Lahat ng navigation links ay gumagana gamit ang bagong struktura ng folder
- ✅ Ang mga pagpapalit ng file at folder ay matagumpay na natapos
- ✅ Ang mga cross-references sa pagitan ng mga chapters ay na-validate

#### Mga Tala
- **Saklaw**: Ang mga pagbabago ay inilapat sa English documentation sa `docs/` folder lamang
- **Mga Pagsasalin**: Ang mga translation folders (`translations/`) ay hindi na-update sa bersyong ito
- **Workshop**: Ang mga materyales sa workshop (`workshop/`) ay hindi na-update sa bersyong ito
- **Mga Halimbawa**: Ang mga file ng halimbawa ay maaaring tumukoy pa rin sa lumang pangalan (aayusin sa susunod na update)
- **Mga Panlabas na Link**: Ang mga panlabas na URL at mga sanggunian sa GitHub repository ay nananatiling hindi nabago

#### Gabay sa Paglipat para sa mga Contributor
Kung mayroon kang mga lokal na branch o dokumentasyon na tumutukoy sa lumang istruktura:
1. I-update ang mga sanggunian sa folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. I-update ang mga sanggunian sa file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Palitan ang pangalan ng produkto: "Azure AI Foundry" → "Microsoft Foundry"
4. Siguraduhing gumagana pa rin ang lahat ng internal na link sa dokumentasyon

---

### [v3.4.0] - 2025-10-24

#### Mga Pagpapahusay sa Preview ng Infrastructure at Validation
**Ang bersyong ito ay nagdadala ng komprehensibong suporta para sa bagong Azure Developer CLI preview feature at pinapahusay ang karanasan ng mga gumagamit ng workshop.**

#### Idinagdag
- **🧪 Dokumentasyon ng azd provision --preview Feature**: Komprehensibong coverage ng bagong kakayahan sa preview ng infrastructure
  - Mga reference sa command at mga halimbawa ng paggamit sa cheat sheet
  - Detalyadong integrasyon sa provisioning guide na may mga use case at benepisyo
  - Integrasyon ng pre-flight check para sa mas ligtas na pag-validate ng deployment
  - Mga update sa getting started guide na may mga safety-first deployment practices
- **🚧 Workshop Status Banner**: Propesyonal na HTML banner na nagpapakita ng status ng development ng workshop
  - Gradient na disenyo na may mga construction indicator para sa malinaw na komunikasyon sa mga gumagamit
  - Timestamp ng huling update para sa transparency
  - Mobile-responsive na disenyo para sa lahat ng uri ng device

#### Pinahusay
- **Kaligtasan ng Infrastructure**: Ang preview functionality ay isinama sa buong deployment documentation
- **Pre-deployment Validation**: Ang mga automated script ay ngayon kasama ang testing ng infrastructure preview
- **Workflow ng Developer**: Na-update ang mga sequence ng command upang isama ang preview bilang pinakamahusay na kasanayan
- **Karanasan sa Workshop**: Malinaw na mga inaasahan para sa mga gumagamit tungkol sa status ng content development

#### Binago
- **Mga Pinakamahusay na Kasanayan sa Deployment**: Ang preview-first workflow ay ngayon inirerekomendang paraan
- **Daloy ng Dokumentasyon**: Ang validation ng infrastructure ay inilipat nang mas maaga sa proseso ng pag-aaral
- **Presentasyon ng Workshop**: Propesyonal na komunikasyon ng status na may malinaw na timeline ng development

#### Pinahusay
- **Safety-First Approach**: Ang mga pagbabago sa infrastructure ay maaari nang ma-validate bago ang deployment
- **Team Collaboration**: Ang mga resulta ng preview ay maaaring ibahagi para sa pagsusuri at pag-apruba
- **Kamalayan sa Gastos**: Mas mahusay na pag-unawa sa mga gastos ng resource bago ang provisioning
- **Pagbawas ng Panganib**: Nabawasan ang mga pagkabigo sa deployment sa pamamagitan ng advance validation

#### Teknikal na Implementasyon
- **Multi-document Integration**: Ang preview feature ay na-dokumentado sa 4 na pangunahing file
- **Mga Pattern ng Command**: Konsistenteng syntax at mga halimbawa sa buong dokumentasyon
- **Integrasyon ng Pinakamahusay na Kasanayan**: Ang preview ay isinama sa mga validation workflow at script
- **Mga Visual Indicator**: Malinaw na NEW feature markings para sa madaling pagtuklas

#### Infrastructure ng Workshop
- **Komunikasyon ng Status**: Propesyonal na HTML banner na may gradient styling
- **Karanasan ng Gumagamit**: Malinaw na status ng development upang maiwasan ang kalituhan
- **Propesyonal na Presentasyon**: Pinapanatili ang kredibilidad ng repository habang nagtatakda ng mga inaasahan
- **Transparency ng Timeline**: Timestamp ng huling update noong Oktubre 2025 para sa accountability

### [v3.3.0] - 2025-09-24

#### Pinahusay na Mga Materyales sa Workshop at Interactive na Karanasan sa Pag-aaral
**Ang bersyong ito ay nagdadala ng komprehensibong mga materyales sa workshop na may browser-based interactive guides at naka-istrukturang learning paths.**

#### Idinagdag
- **🎥 Interactive Workshop Guide**: Browser-based na karanasan sa workshop na may MkDocs preview capability
- **📝 Naka-istrukturang Workshop Instructions**: 7-hakbang na guided learning path mula sa discovery hanggang sa customization
  - 0-Introduction: Pangkalahatang-ideya ng workshop at setup
  - 1-Select-AI-Template: Proseso ng pagtuklas at pagpili ng template
  - 2-Validate-AI-Template: Mga pamamaraan ng deployment at validation
  - 3-Deconstruct-AI-Template: Pag-unawa sa arkitektura ng template
  - 4-Configure-AI-Template: Pag-configure at pag-customize
  - 5-Customize-AI-Template: Advanced na mga pagbabago at iterasyon
  - 6-Teardown-Infrastructure: Cleanup at pamamahala ng resource
  - 7-Wrap-up: Buod at mga susunod na hakbang
- **🛠️ Workshop Tooling**: MkDocs configuration na may Material theme para sa pinahusay na karanasan sa pag-aaral
- **🎯 Hands-On Learning Path**: 3-hakbang na metodolohiya (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless na setup ng development environment

#### Pinahusay
- **AI Workshop Lab**: Pinalawig na may komprehensibong 2-3 oras na naka-istrukturang karanasan sa pag-aaral
- **Dokumentasyon ng Workshop**: Propesyonal na presentasyon na may navigation at visual aids
- **Pag-usad sa Pag-aaral**: Malinaw na step-by-step na gabay mula sa pagpili ng template hanggang sa production deployment
- **Karanasan ng Developer**: Integrated tooling para sa streamlined na development workflows

#### Pinahusay
- **Accessibility**: Browser-based na interface na may search, copy functionality, at theme toggle
- **Self-Paced Learning**: Flexible na istruktura ng workshop na akma sa iba't ibang bilis ng pag-aaral
- **Praktikal na Aplikasyon**: Mga senaryo ng real-world AI template deployment
- **Integrasyon ng Komunidad**: Integrasyon ng Discord para sa suporta at kolaborasyon sa workshop

#### Mga Tampok ng Workshop
- **Built-in Search**: Mabilis na pagtuklas ng keyword at aralin
- **Copy Code Blocks**: Hover-to-copy functionality para sa lahat ng halimbawa ng code
- **Theme Toggle**: Suporta sa dark/light mode para sa iba't ibang kagustuhan
- **Visual Assets**: Mga screenshot at diagram para sa pinahusay na pag-unawa
- **Help Integration**: Direktang access sa Discord para sa suporta ng komunidad

### [v3.2.0] - 2025-09-17

#### Malaking Pagbabago sa Navigation at Chapter-Based Learning System
**Ang bersyong ito ay nagdadala ng komprehensibong chapter-based na istruktura ng pag-aaral na may pinahusay na navigation sa buong repository.**

#### Idinagdag
- **📚 Chapter-Based Learning System**: Na-restructure ang buong kurso sa 8 progresibong mga kabanata ng pag-aaral
  - Kabanata 1: Foundation & Quick Start (⭐ - 30-45 minuto)
  - Kabanata 2: AI-First Development (⭐⭐ - 1-2 oras)
  - Kabanata 3: Configuration & Authentication (⭐⭐ - 45-60 minuto)
  - Kabanata 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 oras)
  - Kabanata 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 oras)
  - Kabanata 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 oras)
  - Kabanata 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 oras)
  - Kabanata 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 oras)
- **📚 Komprehensibong Navigation System**: Konsistenteng navigation headers at footers sa lahat ng dokumentasyon
- **🎯 Progress Tracking**: Checklist ng pagkumpleto ng kurso at sistema ng pag-verify ng pag-aaral
- **🗺️ Gabay sa Learning Path**: Malinaw na entry points para sa iba't ibang antas ng karanasan at layunin
- **🔗 Cross-Reference Navigation**: Malinaw na naka-link ang mga kaugnay na kabanata at mga kinakailangan

#### Pinahusay
- **Istruktura ng README**: Ginawang isang naka-istrukturang learning platform na may chapter-based na organisasyon
- **Navigation ng Dokumentasyon**: Ang bawat pahina ay ngayon may kasamang konteksto ng kabanata at gabay sa pag-usad
- **Organisasyon ng Template**: Ang mga halimbawa at template ay naitugma sa mga naaangkop na kabanata ng pag-aaral
- **Integrasyon ng Resource**: Mga cheat sheet, FAQ, at study guide na konektado sa mga kaugnay na kabanata
- **Integrasyon ng Workshop**: Ang mga hands-on lab ay naitugma sa maraming layunin ng pag-aaral sa kabanata

#### Binago
- **Pag-usad sa Pag-aaral**: Mula sa linear na dokumentasyon patungo sa flexible na chapter-based na pag-aaral
- **Paglalagay ng Configuration**: Inilipat ang configuration guide bilang Kabanata 3 para sa mas maayos na daloy ng pag-aaral
- **Integrasyon ng AI Content**: Mas mahusay na integrasyon ng AI-specific na content sa buong paglalakbay sa pag-aaral
- **Nilalaman ng Produksyon**: Ang mga advanced na pattern ay pinagsama sa Kabanata 8 para sa mga enterprise learner

#### Pinahusay
- **Karanasan ng Gumagamit**: Malinaw na navigation breadcrumbs at mga indicator ng pag-usad sa kabanata
- **Accessibility**: Konsistenteng navigation patterns para sa mas madaling paggalugad ng kurso
- **Propesyonal na Presentasyon**: Istruktura ng kurso na parang unibersidad na angkop para sa akademiko at corporate na pagsasanay
- **Kahusayan sa Pag-aaral**: Nabawasan ang oras sa paghahanap ng kaugnay na content sa pamamagitan ng pinahusay na organisasyon

#### Teknikal na Implementasyon
- **Navigation Headers**: Standardized na navigation ng kabanata sa 40+ na dokumentasyon
- **Footer Navigation**: Konsistenteng gabay sa pag-usad at mga indicator ng pagkumpleto ng kabanata
- **Cross-Linking**: Komprehensibong internal linking system na nag-uugnay sa mga kaugnay na konsepto
- **Chapter Mapping**: Ang mga template at halimbawa ay malinaw na nauugnay sa mga layunin ng pag-aaral

#### Pagpapahusay ng Study Guide
- **📚 Komprehensibong Layunin ng Pag-aaral**: Na-restructure ang study guide upang umayon sa 8-kabanatang sistema
- **🎯 Pagtatasa ng Kabanata**: Ang bawat kabanata ay may kasamang tiyak na layunin ng pag-aaral at praktikal na mga ehersisyo
- **📋 Pagsubaybay sa Pag-usad**: Lingguhang iskedyul ng pag-aaral na may nasusukat na resulta at mga checklist ng pagkumpleto
- **❓ Mga Tanong sa Pagtatasa**: Mga tanong sa pag-validate ng kaalaman para sa bawat kabanata na may propesyonal na resulta
- **🛠️ Praktikal na Ehersisyo**: Mga hands-on na aktibidad na may mga senaryo ng totoong deployment at troubleshooting
- **📊 Pag-usad ng Kasanayan**: Malinaw na pag-unlad mula sa mga pangunahing konsepto hanggang sa mga enterprise pattern na may pokus sa pag-unlad ng karera
- **🎓 Framework ng Sertipikasyon**: Mga resulta ng propesyonal na pag-unlad at sistema ng pagkilala ng komunidad
- **⏱️ Pamamahala ng Timeline**: Naka-istrukturang 10-linggong plano sa pag-aaral na may milestone validation

### [v3.1.0] - 2025-09-17

#### Pinahusay na Multi-Agent AI Solutions
**Ang bersyong ito ay nagpapabuti sa multi-agent retail solution na may mas malinaw na pangalan ng agent at pinahusay na dokumentasyon.**

#### Binago
- **Terminolohiya ng Multi-Agent**: Pinalitan ang "Cora agent" ng "Customer agent" sa buong retail multi-agent solution para sa mas malinaw na pag-unawa
- **Arkitektura ng Agent**: Na-update ang lahat ng dokumentasyon, ARM templates, at mga halimbawa ng code upang gumamit ng konsistenteng "Customer agent" na pangalan
- **Mga Halimbawa ng Configuration**: Na-modernize ang mga pattern ng configuration ng agent na may updated na mga pangalan
- **Konsistensya ng Dokumentasyon**: Tiniyak na lahat ng mga sanggunian ay gumagamit ng propesyonal at deskriptibong pangalan ng agent

#### Pinahusay
- **ARM Template Package**: Na-update ang retail-multiagent-arm-template na may mga sanggunian sa Customer agent
- **Mga Diagram ng Arkitektura**: Na-refresh ang mga Mermaid diagram na may updated na pangalan ng agent
- **Mga Halimbawa ng Code**: Ang mga Python class at halimbawa ng implementasyon ay ngayon gumagamit ng CustomerAgent na pangalan
- **Mga Environment Variable**: Na-update ang lahat ng deployment script upang gumamit ng CUSTOMER_AGENT_NAME na mga convention

#### Pinahusay
- **Karanasan ng Developer**: Mas malinaw na mga tungkulin at responsibilidad ng agent sa dokumentasyon
- **Kahandaan sa Produksyon**: Mas mahusay na pagkakahanay sa mga enterprise naming convention
- **Mga Materyales sa Pag-aaral**: Mas madaling maunawaan ang mga pangalan ng agent para sa mga layuning pang-edukasyon
- **Usability ng Template**: Pinadali ang pag-unawa sa mga function ng agent at mga pattern ng deployment

#### Teknikal na Detalye
- Na-update ang mga Mermaid architecture diagram na may mga sanggunian sa CustomerAgent
- Pinalitan ang mga pangalan ng CoraAgent class ng CustomerAgent sa mga halimbawa ng Python
- Binago ang mga ARM template JSON configuration upang gumamit ng "customer" na uri ng agent
- Na-update ang mga environment variable mula sa CORA_AGENT_* patungo sa CUSTOMER_AGENT_* na mga pattern
- Na-refresh ang lahat ng deployment commands at container configurations

### [v3.0.0] - 2025-09-12

#### Malalaking Pagbabago - Pokus sa AI Developer at Integrasyon ng Azure AI Foundry
**Ang bersyong ito ay nag-transform ng repository sa isang komprehensibong AI-focused na learning resource na may integrasyon sa Azure AI Foundry.**

#### Idinagdag
- **🤖 AI-First Learning Path**: Kumpletong restructure na inuuna ang mga AI developer at engineer
- **Gabay sa Integrasyon ng Azure AI Foundry**: Komprehensibong dokumentasyon para sa pagkonekta ng AZD sa mga serbisyo ng Azure AI Foundry
- **Mga Pattern ng AI Model Deployment**: Detalyadong gabay na sumasaklaw sa pagpili ng modelo, configuration, at mga estratehiya sa production deployment
- **AI Workshop Lab**: 2-3 oras na hands-on workshop para sa pag-convert ng mga AI application sa AZD-deployable solutions
- **Mga Pinakamahusay na Kasanayan sa Produksyon ng AI**: Mga enterprise-ready na pattern para sa pag-scale, pag-monitor, at pag-secure ng mga AI workload
- **Gabay sa AI-Specific Troubleshooting**: Komprehensibong troubleshooting para sa Azure OpenAI, Cognitive Services, at mga isyu sa AI deployment
- **AI Template Gallery**: Itinatampok na koleksyon ng mga template ng Azure AI Foundry na may mga complexity rating
- **Mga Materyales sa Workshop**: Kumpletong istruktura ng workshop na may mga hands-on lab at reference materials

#### Pinahusay
- **Istruktura ng README**: AI-developer focused na may 45% na data ng interes mula sa Azure AI Foundry Discord
- **Mga Learning Path**: Dedikadong AI developer journey kasabay ng tradisyunal na mga path para sa mga estudyante at DevOps engineer
- **Mga Rekomendasyon sa Template**: Itinatampok na mga AI template kabilang ang azure-search-openai-demo, contoso-chat, at openai-chat-app-quickstart
- **Integrasyon ng Komunidad**: Pinahusay na suporta ng Discord community na may mga AI-specific na channel at talakayan

#### Pokus sa Seguridad at Produksyon
- **Mga Pattern ng Managed Identity**: AI-specific na mga configuration sa authentication at seguridad
- **Pag-optimize ng Gastos**: Pagsubaybay sa paggamit ng token at mga kontrol sa budget para sa mga AI workload
- **Multi-Region Deployment**: Mga estratehiya para sa global na deployment ng AI application
- **Performance Monitoring**: AI-specific na mga metric at integrasyon ng Application Insights

#### Kalidad ng Dokumentasyon
- **Linear na Istruktura ng Kurso**: Lohikal na pag-usad mula sa baguhan hanggang sa advanced na mga pattern ng AI deployment
- **Validated na mga URL**: Lahat ng panlabas na repository link ay na-verify at accessible
- **Kumpletong Sanggunian**: Lahat ng internal na dokumentasyon link ay na-validate at gumagana
- **Handa sa Produksyon**: Mga enterprise deployment pattern na may mga totoong halimbawa

### [v2.0.0] - 2025-09-09

#### Malalaking Pagbabago - Restructure ng Repository at Propesyonal na Pagpapahusay
**Ang bersyong ito ay kumakatawan sa isang
- **Presentasyon ng Nilalaman**: Inalis ang mga pandekorasyong elemento para sa malinaw at propesyonal na format
- **Struktura ng Link**: In-update ang lahat ng internal na link para suportahan ang bagong sistema ng nabigasyon

#### Pinahusay
- **Accessibility**: Inalis ang dependency sa emoji para sa mas maayos na compatibility sa screen reader
- **Propesyonal na Hitsura**: Malinis, akademikong estilo ng presentasyon na angkop para sa enterprise learning
- **Karanasan sa Pag-aaral**: May istrukturang approach na may malinaw na layunin at resulta para sa bawat aralin
- **Organisasyon ng Nilalaman**: Mas maayos na daloy at koneksyon sa pagitan ng mga kaugnay na paksa

### [v1.0.0] - 2025-09-09

#### Unang Paglabas - Komprehensibong AZD Learning Repository

#### Idinagdag
- **Struktura ng Core Documentation**
  - Kumpletong serye ng gabay para sa pagsisimula
  - Komprehensibong dokumentasyon sa deployment at provisioning
  - Detalyadong mga resource para sa troubleshooting at debugging
  - Mga tool at pamamaraan para sa pre-deployment validation

- **Getting Started Module**
  - AZD Basics: Mga pangunahing konsepto at terminolohiya
  - Gabay sa Pag-install: Mga tagubilin sa setup na naaayon sa platform
  - Gabay sa Konfigurasyon: Setup ng environment at authentication
  - Tutorial sa Unang Proyekto: Step-by-step na hands-on na pag-aaral

- **Deployment at Provisioning Module**
  - Gabay sa Deployment: Kumpletong dokumentasyon ng workflow
  - Gabay sa Provisioning: Infrastructure as Code gamit ang Bicep
  - Mga best practices para sa production deployments
  - Mga pattern para sa multi-service architecture

- **Pre-deployment Validation Module**
  - Capacity Planning: Validation ng availability ng Azure resources
  - SKU Selection: Komprehensibong gabay sa service tier
  - Pre-flight Checks: Automated validation scripts (PowerShell at Bash)
  - Mga tool para sa pagtatantya ng gastos at pagpaplano ng budget

- **Troubleshooting Module**
  - Karaniwang Isyu: Mga madalas na problema at solusyon
  - Gabay sa Debugging: Sistematikong pamamaraan sa troubleshooting
  - Mga advanced na teknik at tool para sa diagnostic
  - Monitoring ng performance at optimization

- **Mga Resource at Reference**
  - Command Cheat Sheet: Mabilisang reference para sa mahahalagang command
  - Glossary: Komprehensibong terminolohiya at acronym definitions
  - FAQ: Detalyadong sagot sa mga karaniwang tanong
  - Mga link sa external na resource at koneksyon sa komunidad

- **Mga Halimbawa at Template**
  - Halimbawa ng Simple Web Application
  - Template para sa Static Website deployment
  - Konfigurasyon ng Container Application
  - Mga pattern para sa database integration
  - Mga halimbawa ng microservices architecture
  - Implementasyon ng serverless function

#### Mga Tampok
- **Suporta sa Multi-Platform**: Mga gabay sa pag-install at konfigurasyon para sa Windows, macOS, at Linux
- **Iba't ibang Antas ng Kasanayan**: Nilalaman na idinisenyo para sa mga estudyante hanggang sa mga propesyonal na developer
- **Praktikal na Pokus**: Mga hands-on na halimbawa at real-world na senaryo
- **Komprehensibong Saklaw**: Mula sa mga pangunahing konsepto hanggang sa advanced na enterprise patterns
- **Security-First Approach**: Mga best practices sa seguridad na isinama sa kabuuan
- **Cost Optimization**: Gabay para sa cost-effective na deployments at resource management

#### Kalidad ng Dokumentasyon
- **Detalyadong Mga Halimbawa ng Code**: Praktikal, nasubok na mga sample ng code
- **Step-by-Step na Instruksyon**: Malinaw, actionable na gabay
- **Komprehensibong Error Handling**: Troubleshooting para sa mga karaniwang isyu
- **Integrasyon ng Best Practices**: Mga pamantayan at rekomendasyon ng industriya
- **Compatibility ng Bersyon**: Updated sa pinakabagong Azure services at mga tampok ng azd

## Mga Planong Pagpapahusay sa Hinaharap

### Bersyon 3.1.0 (Planado)
#### Pagpapalawak ng AI Platform
- **Suporta sa Multi-Model**: Mga pattern ng integrasyon para sa Hugging Face, Azure Machine Learning, at custom na mga modelo
- **AI Agent Frameworks**: Mga template para sa LangChain, Semantic Kernel, at AutoGen deployments
- **Advanced RAG Patterns**: Mga opsyon sa vector database bukod sa Azure AI Search (Pinecone, Weaviate, atbp.)
- **AI Observability**: Pinahusay na monitoring para sa performance ng modelo, token usage, at kalidad ng response

#### Karanasan ng Developer
- **VS Code Extension**: Integrated AZD + AI Foundry development experience
- **GitHub Copilot Integration**: AI-assisted na pagbuo ng AZD template
- **Interactive Tutorials**: Mga hands-on na coding exercise na may automated validation para sa AI scenarios
- **Video Content**: Supplementary na video tutorials para sa mga visual learner na nakatuon sa AI deployments

### Bersyon 4.0.0 (Planado)
#### Mga Pattern ng Enterprise AI
- **Governance Framework**: Pamamahala ng AI model, compliance, at audit trails
- **Multi-Tenant AI**: Mga pattern para sa pagseserbisyo sa maraming customer gamit ang hiwalay na AI services
- **Edge AI Deployment**: Integrasyon sa Azure IoT Edge at container instances
- **Hybrid Cloud AI**: Mga pattern ng multi-cloud at hybrid deployment para sa AI workloads

#### Mga Advanced na Tampok
- **AI Pipeline Automation**: Integrasyon ng MLOps gamit ang Azure Machine Learning pipelines
- **Advanced Security**: Mga zero-trust pattern, private endpoints, at advanced threat protection
- **Performance Optimization**: Mga advanced na strategy sa tuning at scaling para sa high-throughput AI applications
- **Global Distribution**: Mga pattern para sa content delivery at edge caching para sa AI applications

### Bersyon 3.0.0 (Planado) - Napalitan ng Kasalukuyang Paglabas
#### Mga Iminungkahing Dagdag - Ngayon ay Naipatupad sa v3.0.0
- ✅ **AI-Focused Content**: Komprehensibong integrasyon ng Azure AI Foundry (Tapos na)
- ✅ **Interactive Tutorials**: Hands-on AI workshop lab (Tapos na)
- ✅ **Advanced Security Module**: Mga pattern ng seguridad para sa AI (Tapos na)
- ✅ **Performance Optimization**: Mga strategy sa tuning ng AI workload (Tapos na)

### Bersyon 2.1.0 (Planado) - Bahagyang Naipatupad sa v3.0.0
#### Minor na Pagpapahusay - Ang Iba ay Tapos na sa Kasalukuyang Paglabas
- ✅ **Karagdagang Mga Halimbawa**: Mga senaryo ng deployment na nakatuon sa AI (Tapos na)
- ✅ **Pinalawak na FAQ**: Mga tanong at troubleshooting na nakatuon sa AI (Tapos na)
- **Tool Integration**: Pinahusay na mga gabay sa integrasyon ng IDE at editor
- ✅ **Monitoring Expansion**: Mga pattern ng monitoring at alerting na nakatuon sa AI (Tapos na)

#### Planado pa rin para sa Hinaharap na Paglabas
- **Mobile-Friendly Documentation**: Responsive na disenyo para sa mobile learning
- **Offline Access**: Mga downloadable na dokumentasyon package
- **Pinahusay na Integrasyon ng IDE**: VS Code extension para sa AZD + AI workflows
- **Community Dashboard**: Real-time na metrics ng komunidad at pagsubaybay sa kontribusyon

## Pag-aambag sa Changelog

### Pag-uulat ng Mga Pagbabago
Kapag nag-aambag sa repository na ito, tiyaking ang mga entry sa changelog ay naglalaman ng:

1. **Numero ng Bersyon**: Sumusunod sa semantic versioning (major.minor.patch)
2. **Petsa**: Petsa ng paglabas o pag-update sa format na YYYY-MM-DD
3. **Kategorya**: Idinagdag, Binago, Deprecated, Inalis, Naayos, Seguridad
4. **Malinaw na Deskripsyon**: Maikling deskripsyon ng pagbabago
5. **Pagtatasa ng Epekto**: Paano naapektuhan ang mga kasalukuyang user ng mga pagbabago

### Mga Kategorya ng Pagbabago

#### Idinagdag
- Mga bagong tampok, seksyon ng dokumentasyon, o kakayahan
- Mga bagong halimbawa, template, o learning resources
- Karagdagang mga tool, script, o utility

#### Binago
- Mga pagbabago sa umiiral na functionality o dokumentasyon
- Mga update para mapabuti ang kalinawan o katumpakan
- Pag-aayos ng nilalaman o organisasyon

#### Deprecated
- Mga tampok o approach na unti-unting inaalis
- Mga seksyon ng dokumentasyon na nakatakdang alisin
- Mga pamamaraan na may mas mahusay na alternatibo

#### Inalis
- Mga tampok, dokumentasyon, o halimbawa na hindi na nauugnay
- Lipas na impormasyon o deprecated na approach
- Redundant o pinagsamang nilalaman

#### Naayos
- Mga pagwawasto sa mga error sa dokumentasyon o code
- Pagresolba sa mga naiulat na isyu o problema
- Mga pagpapabuti sa katumpakan o functionality

#### Seguridad
- Mga pagpapabuti o pag-aayos na may kaugnayan sa seguridad
- Mga update sa best practices sa seguridad
- Pagresolba sa mga kahinaan sa seguridad

### Mga Alituntunin sa Semantic Versioning

#### Major Version (X.0.0)
- Mga breaking change na nangangailangan ng aksyon mula sa user
- Malaking restructuring ng nilalaman o organisasyon
- Mga pagbabago na nagbabago sa pangunahing approach o methodology

#### Minor Version (X.Y.0)
- Mga bagong tampok o karagdagan sa nilalaman
- Mga pagpapahusay na nananatiling backward compatible
- Karagdagang mga halimbawa, tool, o resource

#### Patch Version (X.Y.Z)
- Mga pag-aayos ng bug at pagwawasto
- Minor na pagpapabuti sa umiiral na nilalaman
- Mga klaripikasyon at maliliit na enhancement

## Feedback at Mga Suhestiyon mula sa Komunidad

Aktibo naming hinihikayat ang feedback mula sa komunidad para mapabuti ang learning resource na ito:

### Paano Magbigay ng Feedback
- **GitHub Issues**: Mag-ulat ng mga problema o magmungkahi ng mga pagpapabuti (AI-specific na isyu ay welcome)
- **Discord Discussions**: Magbahagi ng mga ideya at makipag-ugnayan sa Azure AI Foundry community
- **Pull Requests**: Mag-ambag ng direktang pagpapabuti sa nilalaman, lalo na sa AI templates at guides
- **Azure AI Foundry Discord**: Makilahok sa #Azure channel para sa AZD + AI discussions
- **Community Forums**: Makilahok sa mas malawak na talakayan ng Azure developer

### Mga Kategorya ng Feedback
- **Katumpakan ng AI Content**: Mga pagwawasto sa impormasyon ng integrasyon at deployment ng AI service
- **Karanasan sa Pag-aaral**: Mga suhestiyon para sa mas pinahusay na daloy ng pag-aaral para sa AI developer
- **Nawawalang AI Content**: Mga kahilingan para sa karagdagang AI templates, patterns, o halimbawa
- **Accessibility**: Mga pagpapabuti para sa iba't ibang pangangailangan sa pag-aaral
- **Integrasyon ng AI Tool**: Mga suhestiyon para sa mas mahusay na workflow ng AI development
- **Mga Pattern ng Production AI**: Mga kahilingan para sa enterprise AI deployment patterns

### Commitment sa Pagtugon
- **Pagtugon sa Isyu**: Sa loob ng 48 oras para sa mga naiulat na problema
- **Mga Kahilingan sa Tampok**: Pagsusuri sa loob ng isang linggo
- **Mga Kontribusyon ng Komunidad**: Pagsusuri sa loob ng isang linggo
- **Mga Isyu sa Seguridad**: Agarang prayoridad na may pinabilis na pagtugon

## Iskedyul ng Pagpapanatili

### Regular na Update
- **Monthly Reviews**: Katumpakan ng nilalaman at validation ng link
- **Quarterly Updates**: Malalaking karagdagan at pagpapahusay sa nilalaman
- **Semi-Annual Reviews**: Komprehensibong restructuring at enhancement
- **Annual Releases**: Malalaking update sa bersyon na may makabuluhang pagpapahusay

### Monitoring at Quality Assurance
- **Automated Testing**: Regular na validation ng mga halimbawa ng code at link
- **Integrasyon ng Feedback ng Komunidad**: Regular na pagsasama ng mga suhestiyon ng user
- **Mga Update sa Teknolohiya**: Pag-align sa pinakabagong Azure services at azd releases
- **Accessibility Audits**: Regular na pagsusuri para sa inclusive design principles

## Patakaran sa Suporta ng Bersyon

### Suporta sa Kasalukuyang Bersyon
- **Pinakabagong Major Version**: Buong suporta na may regular na update
- **Nakaraang Major Version**: Mga update sa seguridad at kritikal na pag-aayos sa loob ng 12 buwan
- **Legacy Versions**: Suporta mula sa komunidad lamang, walang opisyal na update

### Gabay sa Migration
Kapag may bagong major version na inilabas, nagbibigay kami ng:
- **Mga Gabay sa Migration**: Step-by-step na mga tagubilin sa paglipat
- **Mga Tala sa Compatibility**: Mga detalye tungkol sa mga breaking change
- **Suporta sa Tool**: Mga script o utility para tumulong sa migration
- **Suporta ng Komunidad**: Dedicated na forums para sa mga tanong sa migration

---

**Nabigasyon**
- **Nakaraang Aralin**: [Study Guide](resources/study-guide.md)
- **Susunod na Aralin**: Bumalik sa [Main README](README.md)

**Manatiling Updated**: I-follow ang repository na ito para sa mga notification tungkol sa mga bagong release at mahahalagang update sa mga learning material.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat sinisikap naming maging tumpak, pakatandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->