# Madalas Itanong (FAQ)

**Kumuha ng Tulong ayon sa Kabanata**
- **📚 Tahanan ng Kurso**: [AZD For Beginners](../README.md)
- **🚆 Mga Isyu sa Pag-install**: [Chapter 1: Installation & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 Mga Tanong sa AI**: [Chapter 2: AI-First Development](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Pag-troubleshoot**: [Chapter 7: Troubleshooting & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Panimula

Ang komprehensibong FAQ na ito ay nagbibigay ng mga sagot sa mga pinakakaraniwang tanong tungkol sa Azure Developer CLI (azd) at mga deployment sa Azure. Hanapin ang mabilis na mga solusyon sa mga karaniwang problema, unawain ang mga pinakamahusay na kasanayan, at makakuha ng paglilinaw tungkol sa mga konsepto at workflows ng azd.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagrepaso sa FAQ na ito, ikaw ay:
- Makakahanap ng mabilis na sagot sa mga karaniwang tanong at isyu ng Azure Developer CLI
- Makakaunawa ng mga pangunahing konsepto at terminolohiya sa pamamagitan ng praktikal na Q&A na pormat
- Makakakuha ng mga solusyon sa pag-troubleshoot para sa mga madalas na problema at mga sitwasyon ng error
- Matutunan ang mga pinakamahusay na kasanayan sa pamamagitan ng mga karaniwang tanong tungkol sa pag-optimize
- Matuklasan ang mga advanced na tampok at kakayahan sa pamamagitan ng mga tanong na antas-eksperto
- Magagamit ang mga patnubay sa gastos, seguridad, at estratehiya sa deployment nang mabilis

## Mga Kinalabasan ng Pagkatuto

Sa regular na paggamit ng FAQ na ito, magagawa mong:
- Lutasin nang mag-isa ang mga karaniwang problema sa Azure Developer CLI gamit ang mga ibinigay na solusyon
- Gumawa ng mga pinag-isipang desisyon tungkol sa mga estratehiya at pagsasaayos ng deployment
- Maunawaan ang relasyon ng azd sa iba pang mga tool at serbisyo ng Azure
- Ipatupad ang mga pinakamahusay na kasanayan batay sa karanasan ng komunidad at mga rekomendasyon ng eksperto
- Epektibong mag-troubleshoot ng mga problema sa authentication, deployment, at konfigurasyon
- I-optimize ang gastos at performance gamit ang mga insight at rekomendasyon mula sa FAQ

## Talaan ng mga Nilalaman

- [Pagsisimula](#getting-started)
- [Authentication at Access](#authentication--access)
- [Mga Template at Proyekto](#templates--projects)
- [Deployment at Inprastruktura](#deployment--infrastructure)
- [Konfigurasyon at Mga Kapaligiran](#configuration--environments)
- [Pag-troubleshoot](#troubleshooting)
- [Gastos at Billing](#cost--billing)
- [Pinakamahusay na Kasanayan](#best-practices)
- [Mga Advanced na Paksa](#advanced-topics)

---

## Pagsisimula

### Q: Ano ang Azure Developer CLI (azd)?
**A**: Ang Azure Developer CLI (azd) ay isang command-line tool na nakatuon sa developer na nagpapabilis ng panahon mula sa iyong lokal na development environment papuntang Azure. Nagbibigay ito ng mga pinakamahusay na kasanayan sa pamamagitan ng mga template at tumutulong sa buong lifecycle ng deployment.

### Q: Ano ang pagkakaiba ng azd sa Azure CLI?
**A**: 
- **Azure CLI**: Pangkalahatang gamit na tool para sa pamamahala ng mga Azure resource
- **azd**: Nakatuong tool para sa developer para sa mga workflow ng application deployment
- Ang azd ay may sarili nitong authentication at deployment workflow; ang Azure CLI ay isang hiwalay at komplementaryong tool
- Kasama sa azd ang mga template, pamamahala ng kapaligiran, at automation ng deployment

### Q: Kailangan ko ba ng Azure CLI na naka-install para gamitin ang azd?
**A**: Hindi para sa pangunahing workflow ng AZD. Mag-authenticate gamit ang `azd auth login`. I-install ang Azure CLI nang hiwalay kapag ang isang template hook o isang exercise ay hayagang nagpapatakbo ng mga utos na `az`.

### Q: Anong mga programming language ang sinusuportahan ng azd?
**A**: Ang azd ay language-agnostic. Gumagana ito sa:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static websites
- Containerized applications

### Q: Maaari ko bang gamitin ang azd sa mga umiiral na proyekto?
**A**: Oo! Maaari mong:
1. Gamitin ang `azd init` para idagdag ang konfigurasyon ng azd sa umiiral na mga proyekto
2. I-adapt ang umiiral na mga proyekto upang tumugma sa istraktura ng template ng azd
3. Gumawa ng custom na mga template batay sa iyong umiiral na arkitektura

---

## Authentication at Access

### Q: Paano ako mag-authenticate sa Azure gamit ang azd?
**A**: Gamitin ang `azd auth login` na magbubukas ng isang browser window para sa Azure authentication. Para sa mga sitwasyon ng CI/CD, gamitin ang service principals o managed identities.

### Q: Maaari ko bang gamitin ang azd sa maraming Azure subscription?
**A**: Oo. Gamitin ang `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` upang tukuyin kung aling subscription ang gagamitin para sa bawat kapaligiran.

### Q: Anong mga permiso ang kailangan ko para mag-deploy gamit ang azd?
**A**: Karaniwang kailangan mo ng:
- Papel na **Contributor** sa resource group o subscription
- **User Access Administrator** kung nagde-deploy ng mga resource na nangangailangan ng role assignments
- Ang partikular na mga permiso ay nag-iiba depende sa template at mga resource na dini-deploy

### Q: Maaari ko bang gamitin ang azd sa mga CI/CD pipeline?
**A**: Oo naman! Ang azd ay dinisenyo para sa CI/CD integration. Gamitin ang mga service principals para sa authentication at mag-set ng environment variables para sa konfigurasyon.

### Q: Paano ko hahawakan ang authentication sa GitHub Actions?
**A**: Mas mainam ang workload identity federation (OIDC), na naka-configure gamit ang `azd pipeline config`. Ang generated workflow ay nag-i-install ng AZD at nag-authenticate ng AZD nang direkta gamit ang federated identity. Ang isang hakbang na `azure/login` lamang ay hindi naga-establish ng AZD login. Ang isang login step sa loob ng umiiral na trabaho ay:
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

Mag-provision o mag-deploy pagkatapos ng login, gamit ang nilalayong AZD environment, subscription, at naka-configure na lokasyon. Ang federated credential ng identity ay dapat magtiwala sa repository/ref ng workflow o sa GitHub environment, at ang mga Azure role nito ay dapat pahintulutan ang mga hiniling na operasyon.

---

## Mga Template at Proyekto

### Q: Saan ko mahahanap ang mga azd template?
**A**: 
- Opisyal at community templates: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Mga community template: Paghahanap sa GitHub gamit ang "azd-template"
- Gamitin ang `azd template list` para mag-browse ng mga available na template

### Q: Paano ako gagawa ng custom template?
**A**: 
1. Magsimula sa isang umiiral na istraktura ng template
2. Baguhin ang `azure.yaml`, mga file ng infrastruktura, at code ng application
3. Subukan nang lubusan gamit ang `azd up`
4. I-publish sa GitHub kasama ang mga angkop na tag

### Q: Maaari ko bang gamitin ang azd nang walang template?
**A**: Oo, gamitin ang `azd init` sa isang umiiral na proyekto upang malikha ang kinakailangang mga file ng konfigurasyon. Kailangan mong manu-manong i-configure ang `azure.yaml` at mga file ng infrastruktura.

### Q: Ano ang pagkakaiba sa pagitan ng opisyal at community templates?
**A**: 
- **Opisyal na mga template**: Pinangangalagaan ng Microsoft, regular na ina-update, kumpletong dokumentasyon
- **Mga community template**: Ginawa ng mga developer, maaaring may mga espesyal na gamit, nag-iiba ang kalidad at pangangalaga

### Q: Paano ko i-update ang template sa aking proyekto?
**A**: Hindi awtomatikong ina-update ang mga template. Maaari mong:
1. Manu-manong i-compare at pagsamahin ang mga pagbabago mula sa pinagmulang template
2. Magsimula muli gamit ang `azd init` gamit ang na-update na template
3. Piliin lamang ang partikular na mga pagpapabuti mula sa mga na-update na template

---

## Deployment at Inprastruktura

### Q: Anong mga serbisyo ng Azure ang maaaring i-deploy gamit ang azd?
**A**: Maaari i-deploy ng azd ang anumang serbisyo ng Azure gamit ang Bicep/ARM templates, kabilang ang:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Mga networking, seguridad, at monitoring resources

### Q: Maaari ba akong mag-deploy sa maraming rehiyon?
**A**: Oo, i-configure ang maraming rehiyon sa iyong mga Bicep template at itakda nang tama ang location parameter para sa bawat kapaligiran.

### Q: Paano ko hahawakan ang mga migration ng database schema?
**A**: Gamitin ang mga deployment hook sa `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Maaari ba akong mag-deploy ng infrastruktura lamang nang walang mga application?
**A**: Oo, gamitin ang `azd provision` upang mag-deploy ng mga komponent ng infrastruktura na tinukoy sa iyong mga template.

### Q: Paano ako mag-deploy sa umiiral na mga resource ng Azure?
**A**: Oo, kapag sinusuportahan ito ng template. I-refer ang mga umiiral na resource sa Bicep gamit ang `existing` declarations o sa mga dokumentadong existing-resource parameters ng template, at i-map ang mga serbisyo ng application sa kanilang mga target. Hindi nito ini-import ang pagmamay-ari o awtomatikong lumilikha ng nawawalang mga permiso. Suriin ang template bago mag-deploy.

### Q: Maaari ba akong gumamit ng Terraform bilang pamalit sa Bicep?
**A**: Oo. Sinusuportahan ng AZD ang Terraform pati na rin ang Bicep. Pumili ng Terraform-based na template o i-configure ang `infra.provider: terraform` sa `azure.yaml`, kasama ang angkop na mga Terraform file at state/backend configuration. Tingnan ang [Terraform workflow](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasyon at Mga Kapaligiran

### Q: Paano ko pinamamahalaan ang iba't ibang kapaligiran (dev, staging, prod)?
**A**: Gumawa ng hiwalay na mga kapaligiran gamit ang `azd env new <environment-name>` at i-configure ang iba't ibang mga setting para sa bawat isa:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Saan naka-imbak ang mga konfigurasyon ng kapaligiran?
**A**: Sa `.azure` na folder sa loob ng iyong proyekto. Bawat kapaligiran ay may sariling folder na may mga configuration file.

### Q: Paano ko iseset ang environment-specific na konfigurasyon?
**A**: Gamitin ang `azd env set` upang i-configure ang environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Maaari ko bang ibahagi ang mga environment configuration sa mga miyembro ng team?
**A**: Ang `.azure` folder ay naglalaman ng sensitibong impormasyon at hindi dapat i-commit sa version control. Sa halip:
1. Idokumento ang kinakailangang environment variables
2. Gamitin ang mga deployment script upang i-setup ang mga kapaligiran
3. Gamitin ang Azure Key Vault para sa sensitibong konfigurasyon

### Q: Paano ko malalampasan ang mga default ng template?
**A**: Mag-set ng environment variables na tumutugma sa mga parameter ng template:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Tanging mga variable na kinakailangan ng template ang nakakaapekto sa deployment. Ang `SKU_NAME` sa itaas ay isang halimbawa ng custom na input, hindi isang unibersal na setting ng AZD.

---

## Pag-troubleshoot

### Q: Bakit pumapalya ang `azd up`?
**A**: Mga karaniwang sanhi:
1. **Mga isyu sa authentication**: Patakbuhin ang `azd auth login`
2. **Kulang na permiso**: Suriin ang iyong mga Azure role assignment
3. **Pagkakasalungat sa pangalan ng resource**: Suriin ang nagkokonfliktong resource at ang mga input ng pangalan sa template; gumawa ng hiwalay na kapaligiran gamit ang `azd env new` kapag kailangan ng isolation
4. **Mga isyu sa quota/kapasidad**: Suriin ang availability sa rehiyon
5. **Mga error sa template**: I-validate ang mga Bicep template

### Q: Paano ko ide-debug ang mga deployment failure?
**A**: 
1. Gamitin ang `azd deploy --debug` para sa verbose output
2. Suriin ang deployment history sa Azure portal
3. Suriin ang Activity Log sa Azure portal
4. Gamitin ang `azd show` upang ipakita ang kasalukuyang estado ng kapaligiran

### Q: Bakit hindi gumagana ang aking mga environment variable?
**A**: Tingnan:
1. Ang mga pangalan ng variable ay tugma sa mga parameter ng template eksakto
2. Ang mga halaga ay maayos na naka-quote kung may mga spaces
3. Naka-select ang tamang kapaligiran: `azd env select <environment>`
4. Ang mga variable ay naka-set sa tamang kapaligiran

### Q: Paano ko nililinis ang mga nabigong deployment?
**A**: 
```bash
azd down
```
Suriin muna ang napiling kapaligiran at ang kumpirmasyon ng pagtanggal. Binubura nito ang mga na-provision na Azure resource, hindi ang lokal na `.azure` na konfigurasyon ng kapaligiran. Ang `--purge` ay karagdagang humihiling na permanenteng tanggalin ang mga suportadong soft-deleted na resource at maaaring ma-block ng retention/purge protection; hindi ito isang rutineng hakbang sa recovery.

### Q: Bakit hindi ma-access ang aking application pagkatapos ng deployment?
**A**: Suriin:
1. Nakumpleto nang matagumpay ang deployment
2. Naka-run ang application (suriin ang mga log sa Azure portal)
3. Pinapayagan ng Network Security Groups ang traffic
4. Naka-configure nang tama ang DNS/custom domains

---

## Gastos at Billing

### Q: Magkano ang magiging gastos sa azd deployments?
**A**: Ang mga gastos ay nakadepende sa:
- Mga serbisyong Azure na dineploy
- Mga tier/SKU ng serbisyo na pinili
- Mga pagkakaiba sa presyo sa rehiyon
- Mga pattern ng paggamit

Gamitin ang [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) para sa mga pagtataya.

### Q: Paano ko kokontrolin ang gastos sa azd deployments?
**A**: 
1. Gamitin ang mas mababang tier ng SKU para sa mga development environment
2. Mag-setup ng mga budget at alerto sa Azure
3. Gamitin ang `azd down` upang alisin ang mga resource kapag hindi na kailangan
4. Pumili ng angkop na mga rehiyon (nagkakaiba ang gastos batay sa lokasyon)
5. Gamitin ang mga tool ng Azure Cost Management

### Q: Mayroon bang libreng tier na opsyon para sa azd templates?
**A**: May ilang serbisyo na may libreng SKU o buwanang grant, na sakop ng eligibility, hosting plan, rehiyon, at subscription limits. Hindi nito ginagawa ang buong template na libre: ang mga databases, search, networking, registry, telemetry, at model inference ay maaaring magdulot ng hiwalay na singil. Suriin ang [Azure free services list](https://azure.microsoft.com/free/) at kasalukuyang presyo para sa bawat resource bago mag-deploy.

### Q: Paano ko tantyahin ang mga gastos bago mag-deploy?
**A**: 
1. Suriin ang `main.bicep` ng template upang makita kung anong mga resource ang nililikha
2. Gamitin ang Azure Pricing Calculator na may tiyak na mga SKU
3. Mag-deploy muna sa isang development environment upang masubaybayan ang aktwal na mga gastos
4. Gamitin ang Azure Cost Management para sa detalyadong pagsusuri ng gastos

---

## Pinakamahusay na Kasanayan

### Q: Ano ang mga pinakamahusay na kasanayan para sa istraktura ng azd proyekto?
**A**: 
1. Panatilihing hiwalay ang code ng application mula sa infrastruktura
2. Gamitin ang mga makahulugang pangalan ng serbisyo sa `azure.yaml`
3. Magpatupad ng wastong error handling sa mga build script
4. Gamitin ang environment-specific na konfigurasyon
5. Isama ang komprehensibong dokumentasyon

### Q: Paano ko dapat ayusin ang maraming serbisyo sa azd?
**A**: Gamitin ang inirerekomendang istraktura:
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

### Q: Paano ko hahawakan ang mga lihim at sensitibong configuration?
**A**: 
1. Gamitin ang Azure Key Vault para sa mga lihim
2. I-refer ang mga lihim ng Key Vault sa application configuration
3. Huwag kailanman i-commit ang mga lihim sa version control
4. Gamitin ang managed identities para sa service-to-service authentication

### Q: Ano ang inirerekomendang pamamaraan para sa CI/CD gamit ang azd?
**A**: 
1. Gumamit ng hiwalay na mga environment para sa bawat yugto (dev/staging/prod)
2. Magpatupad ng automated testing bago ang deployment
3. Gamitin ang service principals para sa authentication
4. Itago ang sensitibong configuration sa pipeline secrets/variables
5. Magpatupad ng approval gates para sa mga production deployment

---

## Advanced Topics

### Q: Maaari ko bang palawigin ang azd gamit ang custom na functionality?
**A**: Oo, sa pamamagitan ng deployment hooks sa `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q: Paano ko i-integrate ang azd sa umiiral na DevOps processes?
**A**: 
1. Gamitin ang azd commands sa umiiral na mga pipeline script
2. I-standardize ang mga azd templates sa lahat ng team
3. I-integrate sa umiiral na monitoring at alerting
4. Gamitin ang JSON output ng azd para sa pipeline integration

### Q: Maaari ko bang gamitin ang azd kasama ang Azure DevOps?
**A**: Oo, ang azd ay tumatakbo sa anumang CI/CD system. Gumawa ng Azure DevOps pipelines na gumagamit ng azd commands.

### Q: Paano ako makakatulong sa azd o gumawa ng community templates?
**A**: 
1. **azd tool**: Mag-ambag sa [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Sundin ang [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentation**: Mag-ambag sa docs sa [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q: Ano ang roadmap para sa azd?
**A**: Tingnan ang [official roadmap](https://github.com/Azure/azure-dev/projects) para sa mga nakaplanong features at improvements.

### Q: Paano ako magmi-migrate mula sa ibang deployment tools papuntang azd?
**A**: 
1. Suriin ang kasalukuyang deployment architecture
2. Gumawa ng katumbas na Bicep templates
3. I-configure ang `azure.yaml` upang tumugma sa kasalukuyang mga serbisyo
4. Subukan nang lubusan sa development environment
5. Unti-unting i-migrate ang mga environment

---

## May Tanong Pa?

### **Maghanap Muna**
- Tingnan ang [opisyal na dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Maghanap sa [GitHub issues](https://github.com/Azure/azure-dev/issues) para sa mga katulad na problema

### **Humingi ng Tulong**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suporta mula sa komunidad
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Mga teknikal na tanong
- [Azure Discord](https://discord.gg/azure) - Real-time na chat ng komunidad

### **I-report ang mga Isyu**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Mga ulat ng bug at kahilingan ng feature
- Isama ang mga kaukulang log, mga mensahe ng error, at mga hakbang upang maulit

### **Matuto Pa**
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Inirepasong teknikal na gabay: Nobyembre 4, 2026. Ang availability sa cloud at pagpepresyo ay kailangang suriin para sa iyong subscription at rehiyon.*

---

**Pag-navigate**
- **Nakaraang Aralin**: [Glossary](glossary.md)
- **Susunod na Aralin**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->