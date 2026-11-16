# Mga Madalas na Itanong (FAQ)

**Kumuha ng Tulong ayon sa Kabanata**
- **📚 Bahay ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **🚆 Mga Isyu sa Instalasyon**: [Kabanata 1: Instalasyon at Pag-setup](../docs/chapter-01-foundation/installation.md)
- **🤖 Mga Tanong tungkol sa AI**: [Kabanata 2: AI-First na Pag-unlad](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Pag-troubleshoot**: [Kabanata 7: Pag-troubleshoot at Pag-debug](../docs/chapter-07-troubleshooting/common-issues.md)

## Panimula

Ang komprehensibong FAQ na ito ay nagbibigay ng mga sagot sa mga pinaka-karaniwang tanong tungkol sa Azure Developer CLI (azd) at mga deployment sa Azure. Makahanap ng mabilis na mga solusyon sa mga karaniwang problema, maintindihan ang mga pinakamahusay na kasanayan, at magkaroon ng paglilinaw tungkol sa mga konsepto at workflows ng azd.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pag-repaso sa FAQ na ito, ikaw ay:
- Makakahanap ng mabilis na mga sagot sa mga karaniwang tanong at isyu tungkol sa Azure Developer CLI
- Mauunawaan ang mga pangunahing konsepto at terminolohiya gamit ang praktikal na paraan ng tanong at sagot
- Maa-access ang mga solusyon sa pag-troubleshoot para sa mga madalas na problema at senaryo ng error
- Matutunan ang mga pinakamahusay na kasanayan sa pamamagitan ng mga madalas itanong tungkol sa optimisasyon
- Matuklasan ang mga advanced na tampok at kakayahan sa pamamagitan ng mga tanong na eksperto ang antas
- Magrereperensya ng mga gabay sa gastos, seguridad, at estratehiya sa deployment nang madali

## Mga Kinalabasan sa Pagkatuto

Sa regular na pag-refer sa FAQ na ito, kakayanin mong:
- Lutasin nang mag-isa ang mga karaniwang isyu sa Azure Developer CLI gamit ang mga ibinigay na solusyon
- Gumawa ng maalam na mga desisyon tungkol sa mga estratehiya at konfigurasyon sa deployment
- Mauunawaan ang relasyon sa pagitan ng azd at ibang mga Azure na tool at serbisyo
- Maglapat ng mga pinakamahusay na kasanayan base sa karanasan ng komunidad at mga rekomendasyon ng eksperto
- Mag-troubleshoot ng mga problema sa authentication, deployment, at konfigurasyon nang epektibo
- I-optimize ang mga gastos at performance gamit ang mga insight at rekomendasyon sa FAQ

## Talaan ng mga Nilalaman

- [Pagsisimula](#getting-started)
- [Authentication at Access](#authentication--access)
- [Mga Templates at Proyekto](#templates--projects)
- [Deployment at Inprastraktura](#deployment--infrastructure)
- [Konfigurasyon at mga Kapaligiran](#configuration--environments)
- [Pag-troubleshoot](#troubleshooting)
- [Gastos at Billing](#cost--billing)
- [Mga Pinakamahusay na Kasanayan](#best-practices)
- [Mga Advanced na Paksa](#advanced-topics)

---

## Pagsisimula

### Q: Ano ang Azure Developer CLI (azd)?
**A**: Ang Azure Developer CLI (azd) ay isang command-line na tool na nakatuon sa mga developer na nagpapabilis ng oras upang mailipat ang iyong aplikasyon mula sa lokal na kapaligiran ng pag-unlad patungo sa Azure. Nagbibigay ito ng mga pinakamahusay na kasanayan sa pamamagitan ng mga template at tumutulong sa buong lifecycle ng deployment.

### Q: Ano ang pagkakaiba ng azd sa Azure CLI?
**A**: 
- **Azure CLI**: Tool na pangkalahatan para sa pamamahala ng mga Azure resources
- **azd**: Tool na nakatuon sa developer para sa mga workflow ng deployment ng aplikasyon
- May sariling authentication at deployment workflow ang azd; ang Azure CLI ay hiwalay, pangkomplementong tool
- Kasama sa azd ang mga template, pamamahala ng kapaligiran, at awtomasyon sa deployment

### Q: Kailangan ko ba ng Azure CLI na naka-install para magamit ang azd?
**A**: Hindi para sa pangunahing workflow ng AZD. Mag-authenticate gamit ang `azd auth login`. I-install ang Azure CLI nang hiwalay kapag ang isang template hook o ehersisyo ay partikular na nagpapatakbo ng mga utos na `az`.

### Q: Anong mga programming language ang sinusuportahan ng azd?
**A**: Language-agnostic ang azd. Gumagana ito sa:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Mga static na website
- Mga containerized na aplikasyon

### Q: Maaari ko bang gamitin ang azd sa mga umiiral na proyekto?
**A**: Oo! Maaari mong:
1. Gamitin ang `azd init` para idagdag ang konfigurasyon ng azd sa mga umiiral na proyekto
2. I-adapt ang mga umiiral na proyekto upang tumugma sa istraktura ng template ng azd
3. Gumawa ng mga custom na template base sa umiiral mong arkitektura

### Q: Ano ang nagbago sa general availability ng Foundry extension?
**A**: Naabot ng `microsoft.foundry` bundle ang bersyon 1.0 at GA noong Nobyembre 5, 2026. Sa AZD 1.37.0+ gamitin ang `azd ext install microsoft.foundry` para i-install ang pitong pangunahing extension para sa mga agent, koneksyon, inspector, proyekto, routines, skills, at toolboxes. Hindi ito isang bagong command namespace, at ang mga bahagi nito ay independenteng may sariling bersyon. Ang mga evaluation, dataset, fine-tuning, at custom models ay naka-install nang hiwalay; ang mga opsyonal na feature sa preview ay hindi nagiging GA dahil lamang GA ang bundle.

Gumagamit ang [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) ng Python 3.13+ at kasalukuyang uv. `azd ai agent run` ay nagbubukas ng Agent Inspector nang lokal, ngunit ang mga tawag sa modelo ay gumagamit pa rin ng Azure at may kasamang singil. Ang code-mode na `azd deploy` ay nag-upload ng source para sa remote build nang hindi kailangan ng lokal na container build.

### Q: Tinatanggal ba ng `azd down` ang hosted agent mula sa umiiral na Foundry project?
**A**: Hindi para sa reused-project na landas na inilalarawan sa hosted-agent quickstart: iniiwan nito ang proyekto, hosted agent, at iba pang resources nang buo. Alisin ang mga hindi gustong resources nang magkahiwalay nang hindi nade-delete ang mga shared resources. Kung ang kapaligiran ay gumawa ng bagong Foundry project, tinatanggal ng `azd down` ang resource group nito at lahat ng laman nito. Suriin ang [gabayan sa paglilinis](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) at mga paalala sa pagtanggal bago mag-kumpirma.

---

## Authentication at Access

### Q: Paano ako mag-authenticate sa Azure gamit ang azd?
**A**: Gamitin ang `azd auth login` na magbubukas ng browser window para sa authentication sa Azure. Para sa mga senaryo ng CI/CD, gamitin ang service principals o managed identities.

### Q: Maaari ko bang gamitin ang azd sa maraming Azure subscription?
**A**: Oo. Gamitin ang `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para tukuyin kung anong subscription ang gagamitin para sa bawat kapaligiran.

### Q: Anong mga permiso ang kailangan ko para mag-deploy gamit ang azd?
**A**: Karaniwan kailangan mo ng:
- **Contributor** na papel sa resource group o subscription
- **User Access Administrator** kung nagde-deploy ng mga resources na nangangailangan ng role assignments
- Ang tiyak na permiso ay nag-iiba depende sa template at mga rekurso na dine-deploy

### Q: Maaari ko bang gamitin ang azd sa CI/CD pipelines?
**A**: Oo naman! Dinisenyo ang azd para sa integrasyon ng CI/CD. Gamitin ang mga service principal para sa authentication at itakda ang mga variable ng kapaligiran para sa konfigurasyon.

### Q: Paano ko hahawakan ang authentication sa GitHub Actions?
**A**: Gamitin ang workload identity federation (OIDC), naka-configure sa `azd pipeline config`. Ang nilikhang workflow ay nag-iinstall ng AZD at nag-authenticate ng AZD nang direkta gamit ang federated identity. Ang isang `azure/login` na hakbang lamang ay hindi nagtatatag ng AZD login. Ang login step sa loob ng umiiral na trabaho ay:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Mag-provision o mag-deploy pagkatapos ng login, gamit ang nakalaang AZD environment, subscription, at location na naka-configure. Ang federated credential ng identity ay dapat magtiwala sa repository/ref ng workflow o Azure environment, at ang mga papel nito sa Azure ay dapat payagan ang hinihinging operasyon.

---

## Mga Template at Proyekto

### Q: Saan ko mahahanap ang mga template ng azd?
**A**: 
- Mga opisyal at komunidad na template: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Mga komunidad na template: GitHub search para sa "azd-template"
- Gamitin ang `azd template list` upang i-browse ang mga available na template

### Q: Paano ako gagawa ng custom template?
**A**: 
1. Magsimula sa umiiral na istraktura ng template
2. Baguhin ang `azure.yaml`, mga infrastructure file, at code ng aplikasyon
3. Subukan nang mabuti gamit ang `azd up`
4. I-publish sa GitHub na may angkop na mga tag

### Q: Maaari ko bang gamitin ang azd nang walang template?
**A**: Oo, gamitin ang `azd init` sa umiiral na proyekto upang gumawa ng kinakailangang mga configuration file. Kailangan mong mano-manong i-configure ang `azure.yaml` at mga infrastructure file.

### Q: Ano ang pagkakaiba ng opisyal at komunidad na mga template?
**A**: 
- **Opisyal na mga template**: Pinapanatili ng Microsoft, regular na ina-update, may komprehensibong dokumentasyon
- **Komunidad na mga template**: Ginawa ng mga developer, maaaring may espesyal na gamit, iba-iba ang kalidad at maintenance

### Q: Paano ko ia-update ang template sa aking proyekto?
**A**: Hindi awtomatikong na-a-update ang mga template. Maaari mong:
1. Mano-manong ikumpara at pagsamahin ang mga pagbabago mula sa source template
2. Magsimula muli gamit ang `azd init` gamit ang na-update na template
3. Pumili lamang ng mga partikular na pagbuti mula sa mga na-update na template

---

## Deployment at Inprastraktura

### Q: Anong mga Azure services ang kayang i-deploy ng azd?
**A**: Kayang i-deploy ng azd ang anumang Azure service sa pamamagitan ng Bicep/ARM templates, kabilang ang:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, seguridad, at mga monitoring resource

### Q: Maaari ba akong mag-deploy sa maraming rehiyon?
**A**: Oo, i-configure ang maraming rehiyon sa iyong Bicep template at itakda ang lokasyon na parameter nang naaangkop para sa bawat kapaligiran.

### Q: Paano ko hahawakan ang mga database schema migration?
**A**: Gamitin ang mga deployment hook sa `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Maaari ko bang i-deploy ang imprastraktura lang nang walang mga aplikasyon?
**A**: Oo, gamitin ang `azd provision` upang i-deploy lamang ang mga komponent ng imprastraktura na tinukoy sa iyong mga template.

### Q: Paano ako mag-deploy sa mga umiiral na Azure resources?
**A**: Oo, kapag sinusuportahan ito ng template. I-reference ang umiiral na mga resource gamit ang mga deklarasyon ng Bicep na `existing` o ang mga documented na existing-resource parameter ng template, at i-map ang mga serbisyo ng aplikasyon sa kanilang layuning target. Hindi nito ini-import ang pag-aari o awtomatikong lumilikha ng mga nawawalang permiso. Suriin ang template bago mag-deploy.

### Q: Maaari ko bang gamitin ang Terraform sa halip na Bicep?
**A**: Oo. Sinusuportahan ng AZD ang Terraform pati na rin ang Bicep. Pumili ng template na nakabase sa Terraform o i-configure ang `infra.provider: terraform` sa `azure.yaml`, kasama ang angkop na mga Terraform file at state/backend na konfigurasyon. Tingnan ang [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasyon at mga Kapaligiran

### Q: Paano ko pamahalaan ang iba’t ibang kapaligiran (dev, staging, prod)?
**A**: Gumawa ng magkahiwalay na mga kapaligiran gamit ang `azd env new <environment-name>` at ayusin ang iba’t ibang settings para sa bawat isa:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Saan nakaimbak ang mga konfigurasyon ng kapaligiran?
**A**: Sa `.azure` na folder sa loob ng iyong direktoryo ng proyekto. Bawat kapaligiran ay may sariling folder na may mga configuration file.

### Q: Paano ako mag-set ng environment-specific configuration?
**A**: Gamitin ang `azd env set` upang i-configure ang mga environment variable:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Maaari ko bang i-share ang mga environment configuration sa mga kasama sa team?
**A**: Ang `.azure` na folder ay naglalaman ng sensitibong impormasyon at hindi dapat i-commit sa version control. Sa halip:
1. Idokumento ang mga kinakailangang environment variable
2. Gamitin ang mga deployment script para mag-set up ng mga kapaligiran
3. Gamitin ang Azure Key Vault para sa sensitibong konfigurasyon

### Q: Paano ko i-override ang mga default ng template?
**A**: Mag-set ng environment variables na tumutugma sa mga parameter ng template:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Tanging ang mga variable na ginagamit ng template ang nakakaapekto sa deployment. Ang `SKU_NAME` sa itaas ay isang halimbawa ng custom na input, hindi isang unibersal na setting ng AZD.

---

## Pag-troubleshoot

### Q: Bakit pumapalya ang `azd up`?
**A**: Mga karaniwang sanhi:
1. **Mga isyu sa authentication**: Patakbuhin ang `azd auth login`
2. **Hindi sapat na permiso**: Suriin ang iyong Azure role assignments
3. **Mga conflict sa pangalan ng resource**: Suriin ang nagtatalunang resource at ang mga input ng pangalan sa template; gumawa ng hiwalay na kapaligiran gamit ang `azd env new` kapag kailangan ang pag-iisa
4. **Mga isyu sa quota/capacity**: Suriin ang availability sa rehiyon
5. **Mga error sa template**: Validate ang mga Bicep template

### Q: Paano ko i-debug ang mga pagkabigo sa deployment?
**A**: 
1. Gamitin ang `azd deploy --debug` para sa verbose output
2. Suriin ang kasaysayan ng deployment sa Azure portal
3. Repasuhin ang Activity Log sa Azure portal
4. Gamitin ang `azd show` para ipakita ang kasalukuyang estado ng kapaligiran

### Q: Bakit hindi gumagana ang aking mga environment variable?
**A**: Suriin ang:
1. Tumutugma ba ang mga pangalan ng variable sa mga parameter ng template nang eksakto
2. Tama ba ang pag-quote sa mga value kung may mga space
3. Napili ba ang kapaligiran: `azd env select <environment>`
4. Na-set ba ang mga variable sa tamang kapaligiran

### Q: Paano ko lilinisin ang mga nabigong deployment?
**A**: 
```bash
azd down
```
Suriin muna ang napiling kapaligiran at mga kumpirmasyon sa pagtanggal. Ito ay nagbubura ng mga provisioned Azure resource, hindi ang lokal na `.azure` na configuration ng kapaligiran. Ang `--purge` ay dagdag na humihiling ng permanenteng pagtanggal ng suportadong soft-deleted na resource at maaaring hadlangan ng retention/purge protection; hindi ito isang routine recovery step.

### Q: Bakit hindi ma-access ang aking aplikasyon pagkatapos i-deploy?
**A**: Suriin ang:
1. Tapos ba nang maayos ang deployment
2. Tumakbo ba ang aplikasyon (suriin ang mga log sa Azure portal)
3. Pinapayagan ba ng network security groups ang traffic
4. Tama ba ang pagkaka-configure ng DNS/custom domains

---

## Gastos at Billing

### Q: Magkano ang magagastos sa azd deployments?
**A**: Nakasalalay ang gastos sa:
- Mga Azure service na dina-deploy
- Mga tier/SKU ng serbisyo na pinili
- Mga pagkakaiba sa presyo sa rehiyon
- Mga pattern ng paggamit

Gamitin ang [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) para sa pagtatantya.

### Q: Paano ko makokontrol ang gastos sa azd deployments?
**A**: 
1. Gumamit ng lower-tier SKU para sa mga development environment
2. Mag-set up ng Azure budgets at alerts
3. Gamitin ang `azd down` para tanggalin ang mga resource kapag hindi na kailangan
4. Pumili ng angkop na mga rehiyon (iba ang gastos depende sa lokasyon)
5. Gamitin ang Azure Cost Management tools

### Q: May mga libreng tier ba para sa mga azd template?
**A**: Ang ilang serbisyo ay may mga libreng SKU o buwanang grant, depende sa pagiging karapat-dapat, hosting plan, rehiyon, at limitasyon ng subscription. Hindi nito ginagawang libre ang buong template: ang mga database, paghahanap, networking, registry, telemetry, at model inference ay maaaring magkaroon ng sarili nilang singil. Tingnan ang [Azure free services list](https://azure.microsoft.com/free/) at kasalukuyang presyo para sa bawat resource bago mag-deploy.

### Q: Paano ko maitataya ang mga gastos bago mag-deploy?
**A**: 
1. Suriin ang `main.bicep` ng template upang makita kung anu-anong mga resources ang nililikha
2. Gamitin ang Azure Pricing Calculator na may partikular na mga SKU
3. I-deploy muna sa development environment upang suriin ang aktwal na gastos
4. Gamitin ang Azure Cost Management para sa detalyadong pagsusuri sa gastos

---

## Pinakamahuhusay na Praktis

### Q: Ano ang mga pinakamahusay na praktis para sa istruktura ng azd project?
**A**: 
1. Panatilihing hiwalay ang application code mula sa infrastructure
2. Gumamit ng makabuluhang mga pangalan ng serbisyo sa `azure.yaml`
3. Magpatupad ng tamang error handling sa mga build script
4. Gumamit ng environment-specific configuration
5. Isama ang komprehensibong dokumentasyon

### Q: Paano ko dapat ayusin ang maraming serbisyo sa azd?
**A**: Gamitin ang inirerekomendang istruktura:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q: Dapat ko bang i-commit ang `.azure` folder sa version control?
**A**: **Hindi!** Ang `.azure` folder ay naglalaman ng sensitibong impormasyon. Idagdag ito sa `.gitignore`:
```gitignore
.azure/
```

### Q: Paano ko hahawakan ang mga sikreto at sensitibong configuration?
**A**: 
1. Gamitin ang Azure Key Vault para sa mga sikreto
2. I-refer ang mga sikreto ng Key Vault sa application configuration
3. Huwag kailanman i-commit ang mga sikreto sa version control
4. Gumamit ng managed identities para sa service-to-service authentication

### Q: Ano ang inirerekomendang paraan para sa CI/CD gamit ang azd?
**A**: 
1. Gumamit ng hiwalay na mga environment para sa bawat yugto (dev/staging/prod)
2. Magpatupad ng automated testing bago mag-deploy
3. Gumamit ng service principals para sa authentication
4. I-imbak ang sensitibong configuration sa mga pipeline secrets/variables
5. Magpatupad ng approval gates para sa mga production deployment

---

## Mga Advanced na Paksa

### Q: Maaari ko bang palawakin ang azd gamit ang custom na functionality?
**A**: Oo, sa pamamagitan ng deployment hooks sa `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Paano ko i-integrate ang azd sa umiiral na mga proseso ng DevOps?
**A**: 
1. Gamitin ang mga utos ng azd sa mga umiiral na pipeline script
2. Standardisahin ang azd templates sa pagitan ng mga team
3. I-integrate sa umiiral na monitoring at alerting
4. Gamitin ang JSON output ng azd para sa pipeline integration

### Q: Maaari ko bang gamitin ang azd sa Azure DevOps?
**A**: Oo, ang azd ay gumagana sa anumang CI/CD system. Gumawa ng mga Azure DevOps pipeline na gumagamit ng mga utos ng azd.

### Q: Paano ako makakatulong sa azd o makakalikha ng mga community template?
**A**: 
1. **azd tool**: Mag-ambag sa [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Sundin ang [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentasyon**: Mag-ambag sa docs sa [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Ano ang roadmap para sa azd?
**A**: Tingnan ang [opisyal na roadmap](https://github.com/Azure/azure-dev/projects) para sa mga planadong tampok at pagpapabuti.

### Q: Paano ako mag-migrate mula sa ibang deployment tools papuntang azd?
**A**: 
1. Suriin ang kasalukuyang arkitektura ng deployment
2. Gumawa ng katumbas na Bicep templates
3. I-configure ang `azure.yaml` upang tumugma sa kasalukuyang mga serbisyo
4. Subukan ng mabuti sa development environment
5. Unti-unting i-migrate ang mga environment

---

## May Mga Tanong Ka Pa Ba?

### **Maghanap muna**
- Tingnan ang [opisyal na dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Maghanap sa [GitHub issues](https://github.com/Azure/azure-dev/issues) para sa mga katulad na problema

### **Humingi ng Tulong**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suporta mula sa komunidad
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Mga teknikal na tanong
- [Azure Discord](https://discord.gg/azure) - Real-time na chat ng komunidad

### **I-report ang mga Isyu**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Mga bug report at feature request
- Isama ang mga kaugnay na log, mga mensahe ng error, at mga hakbang para maulit ang problema

### **Matuto Pa**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Sinuring teknikal na gabay: Nobyembre 4, 2026. Dapat suriin ang availability ng cloud at presyo para sa iyong subscription at rehiyon.*

---

**Pag-navigate**
- **Nakaraang Aralin**: [Glossary](glossary.md)
- **Susunod na Aralin**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->