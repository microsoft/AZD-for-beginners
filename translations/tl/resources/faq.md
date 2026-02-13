# Mga Madalas Itinanong (FAQ)

**Kumuha ng Tulong ayon sa Kabanata**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Nagsisimula](../README.md)
- **🚆 Mga Isyu sa Pag-install**: [Kabanata 1: Pag-install at Pag-setup](../docs/getting-started/installation.md)
- **🤖 Mga Tanong tungkol sa AI**: [Kabanata 2: Pag-unlad na Pinangungunahan ng AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Pag-troubleshoot**: [Kabanata 7: Pag-troubleshoot at Pag-debug](../docs/troubleshooting/common-issues.md)

## Panimula

Ang komprehensibong FAQ na ito ay nagbibigay ng mga sagot sa mga pinaka-karaniwang tanong tungkol sa Azure Developer CLI (azd) at mga deployment sa Azure. Hanapin ang mabilisang solusyon sa mga pangkaraniwang problema, unawain ang pinakamahusay na kasanayan, at makakuha ng paglilinaw sa mga konsepto at workflow ng azd.

## Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagrepaso sa FAQ na ito, makakamit mo:
- Mabilis na mga sagot sa mga karaniwang tanong at isyu tungkol sa Azure Developer CLI
- Unawain ang mga pangunahing konsepto at terminolohiya sa pamamagitan ng praktikal na Q&A na format
- Makakuha ng mga solusyon sa pag-troubleshoot para sa madalas na problema at mga sitwasyon ng error
- Matutunan ang mga pinakamahusay na kasanayan sa pamamagitan ng mga karaniwang tanong tungkol sa pag-optimize
- Tuklasin ang mga advanced na tampok at kakayahan sa pamamagitan ng mga tanong para sa eksperto
- Matiyak na makakakuha ng gabay tungkol sa gastos, seguridad, at estratehiya sa deployment nang epektibo

## Mga Kinalabasan ng Pagkatuto

Sa regular na pag-refer sa FAQ na ito, magagawa mong:
- Malutas nang mag-isa ang mga karaniwang isyu sa Azure Developer CLI gamit ang mga ipinakitang solusyon
- Gumawa ng mga may-akdang pagpapasya tungkol sa mga estratehiya at konfigurasyon ng deployment
- Unawain ang ugnayan sa pagitan ng azd at iba pang mga Azure tool at serbisyo
- Ilapat ang mga pinakamahusay na kasanayan batay sa karanasan ng komunidad at rekomendasyon ng mga eksperto
- Mag-troubleshoot nang epektibo ng mga problema sa authentication, deployment, at konfigurasyon
- I-optimize ang mga gastos at performance gamit ang mga pananaw at rekomendasyon mula sa FAQ

## Talaan ng Nilalaman

- [Pagsisimula](../../../resources)
- [Pagpapatotoo & Pag-access](../../../resources)
- [Mga Template & Proyekto](../../../resources)
- [Deployment & Imprastruktura](../../../resources)
- [Konfigurasyon & Mga Kapaligiran](../../../resources)
- [Pag-troubleshoot](../../../resources)
- [Gastos & Pagsingil](../../../resources)
- [Pinakamahusay na Kasanayan](../../../resources)
- [Mga Advanced na Paksa](../../../resources)

---

## Pagsisimula

### Q: Ano ang Azure Developer CLI (azd)?
**A**: Ang Azure Developer CLI (azd) ay isang command-line na tool na nakatuon sa developer na nagpapabilis ng oras mula sa iyong lokal na development environment hanggang sa Azure. Nagbibigay ito ng mga pinakamahusay na kasanayan sa pamamagitan ng mga template at tumutulong sa buong lifecycle ng deployment.

### Q: Paano naiiba ang azd mula sa Azure CLI?
**A**: 
- **Azure CLI**: Pangkaraniwang tool para sa pamamahala ng mga Azure na resource
- **azd**: Tool na nakatuon sa developer para sa mga workflow ng deployment ng application
- azd ay gumagamit ng Azure CLI sa loob ngunit nagbibigay ng mas mataas na antas ng abstraksyon para sa mga karaniwang scenario ng development
- azd ay may kasamang mga template, pamamahala ng kapaligiran, at automation ng deployment

### Q: Kailangan ko ba ng Azure CLI na naka-install para gamitin ang azd?
**A**: Oo, nangangailangan ang azd ng Azure CLI para sa authentication at ilang operasyon. I-install muna ang Azure CLI, pagkatapos ay i-install ang azd.

### Q: Anong mga programming language ang sinusuportahan ng azd?
**A**: Ang azd ay hindi naka-depende sa wika. Gumagana ito sa:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Static na mga website
- Mga application na naka-container

### Q: Maaari ko bang gamitin ang azd sa mga umiiral na proyekto?
**A**: Oo! Maaari kang:
1. Gumamit ng `azd init` para idagdag ang konfigurasyon ng azd sa umiiral na mga proyekto
2. I-adapt ang umiiral na mga proyekto upang tumugma sa istraktura ng template ng azd
3. Lumikha ng mga custom na template batay sa iyong umiiral na arkitektura

---

## Pagpapatotoo & Pag-access

### Q: Paano ako magpapatotoo sa Azure gamit ang azd?
**A**: Gamitin ang `azd auth login` na magbubukas ng browser window para sa authentication sa Azure. Para sa mga sitwasyon ng CI/CD, gumamit ng mga service principal o managed identities.

### Q: Maaari ko bang gamitin ang azd sa maraming Azure subscriptions?
**A**: Oo. Gamitin ang `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` upang tukuyin kung aling subscription ang gagamitin para sa bawat environment.

### Q: Anong mga pahintulot ang kailangan ko para mag-deploy gamit ang azd?
**A**: Kadalasan kailangan mo ng:
- **Contributor** role sa resource group o subscription
- **User Access Administrator** kung magde-deploy ng mga resource na nangangailangan ng role assignments
- Nag-iiba ang mga partikular na pahintulot depende sa template at mga resource na idedeploy

### Q: Maaari ko bang gamitin ang azd sa mga CI/CD pipeline?
**A**: Oo naman! Dinisenyo ang azd para sa integrasyon sa CI/CD. Gumamit ng mga service principal para sa authentication at mag-set ng mga environment variable para sa konfigurasyon.

### Q: Paano ko hinahawakan ang authentication sa GitHub Actions?
**A**: Gamitin ang Azure Login action na may service principal credentials:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mga Template & Proyekto

### Q: Saan ko mahahanap ang mga template ng azd?
**A**: 
- Mga opisyal na template: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Mga template ng komunidad: Maghanap sa GitHub para sa "azd-template"
- Gamitin ang `azd template list` para mag-browse ng mga magagamit na template

### Q: Paano ako lumikha ng custom na template?
**A**: 
1. Magsimula sa umiiral na istraktura ng template
2. Baguhin ang `azure.yaml`, mga infrastructure file, at code ng application
3. Subukan nang mabuti gamit ang `azd up`
4. I-publish sa GitHub na may angkop na mga tag

### Q: Maaari ko bang gamitin ang azd nang walang template?
**A**: Oo, gamitin ang `azd init` sa isang umiiral na proyekto upang likhain ang kinakailangang mga konfigurasyon na file. Kailangan mong mano-manong i-configure ang `azure.yaml` at mga infrastructure file.

### Q: Ano ang pagkakaiba sa pagitan ng opisyal at komunidad na mga template?
**A**: 
- **Opisyal na mga template**: Pinapanatili ng Microsoft, regular na ina-update, may komprehensibong dokumentasyon
- **Mga template ng komunidad**: Nilikha ng mga developer, maaaring may espesyalisadong gamit, nag-iiba ang kalidad at pag-maintain

### Q: Paano ko i-update ang template sa aking proyekto?
**A**: Hindi awtomatikong nai-update ang mga template. Maaari mong:
1. Mano-manong i-compare at i-merge ang mga pagbabago mula sa source template
2. Magsimula muli gamit ang `azd init` gamit ang na-update na template
3. Piliin ang partikular na mga pagpapabuti mula sa na-update na mga template

---

## Deployment & Imprastruktura

### Q: Anong mga serbisyo ng Azure ang maaaring i-deploy ng azd?
**A**: Maaari i-deploy ng azd ang anumang Azure service sa pamamagitan ng Bicep/ARM templates, kasama ang:
- App Services, Container Apps, Functions
- Mga database (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, seguridad, at mga monitoring na resource

### Q: Maaari ba akong mag-deploy sa maraming rehiyon?
**A**: Oo, i-configure ang maraming rehiyon sa iyong mga Bicep template at itakda ang location parameter nang naaangkop para sa bawat environment.

### Q: Paano ko hinahawakan ang mga database schema migrations?
**A**: Gamitin ang deployment hooks sa `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q: Maaari ko bang ideploy ang imprastruktura lamang nang hindi kasama ang mga application?
**A**: Oo, gamitin ang `azd provision` para i-deploy lamang ang mga componente ng imprastruktura na naka-define sa iyong mga template.

### Q: Paano ako mag-de-deploy sa umiiral na mga Azure resource?
**A**: Ito ay kumplikado at hindi direktang sinusuportahan. Maaari mong:
1. I-import ang umiiral na mga resource sa iyong mga Bicep template
2. Gumamit ng mga reference sa umiiral na resource sa mga template
3. Baguhin ang mga template upang kondisyunal na lumikha o i-reference ang mga resource

### Q: Maaari ko bang gamitin ang Terraform sa halip na Bicep?
**A**: Sa kasalukuyan, pangunahing sinusuportahan ng azd ang Bicep/ARM templates. Hindi opisyal na available ang suporta para sa Terraform, bagaman maaaring may umiiral na mga solusyon mula sa komunidad.

---

## Konfigurasyon & Mga Kapaligiran

### Q: Paano ko pinamamahalaan ang iba't ibang environment (dev, staging, prod)?
**A**: Lumikha ng hiwalay na mga environment gamit ang `azd env new <environment-name>` at i-configure ang iba't ibang setting para sa bawat isa:
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q: Saan naka-imbak ang mga konfigurasyon ng environment?
**A**: Sa loob ng `.azure` folder sa loob ng iyong project directory. Ang bawat environment ay may sariling folder na may mga configuration file.

### Q: Paano ako nagse-set ng environment-specific na konfigurasyon?
**A**: Gamitin ang `azd env set` para i-configure ang mga environment variable:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q: Maaari ko bang i-share ang mga konfigurasyon ng environment sa mga kasamahan sa team?
**A**: Ang `.azure` folder ay naglalaman ng sensitibong impormasyon at hindi dapat i-commit sa version control. Sa halip:
1. I-dokumento ang kinakailangang mga environment variable
2. Gumamit ng deployment scripts para i-set up ang mga environment
3. Gumamit ng Azure Key Vault para sa sensitibong konfigurasyon

### Q: Paano ko o-o-override ang mga default ng template?
**A**: Mag-set ng mga environment variable na tumutugma sa mga parameter ng template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Pag-troubleshoot

### Q: Bakit nabibigo ang `azd up`?
**A**: Mga karaniwang sanhi:
1. **Mga isyu sa authentication**: Patakbuhin ang `azd auth login`
2. **Kakulangan sa pahintulot**: Suriin ang iyong mga role assignment sa Azure
3. **Mga conflict sa pagpapangalan ng resource**: Baguhin ang AZURE_ENV_NAME
4. **Mga isyu sa quota/kakayahan**: Suriin ang availability sa rehiyon
5. **Mga error sa template**: I-validate ang mga Bicep template

### Q: Paano ko ide-debug ang mga pagkabigo sa deployment?
**A**: 
1. Gamitin ang `azd deploy --debug` para sa detalyadong output
2. Suriin ang kasaysayan ng deployment sa Azure portal
3. Review-hin ang Activity Log sa Azure portal
4. Gamitin ang `azd show` para ipakita ang kasalukuyang estado ng environment

### Q: Bakit hindi gumagana ang aking mga environment variable?
**A**: Suriin:
1. Tumutugma ang mga pangalan ng variable sa mga parameter ng template nang eksakto
2. Tama ang pag-quote ng mga value kung mayroon silang spaces
3. Napili ang tamang environment: `azd env select <environment>`
4. Na-set ang mga variable sa tamang environment

### Q: Paano ko nililinis ang mga nabigong deployment?
**A**: 
```bash
azd down --force --purge
```
Inaalis nito ang lahat ng mga resource at configuration ng environment.

### Q: Bakit hindi ma-access ang aking application pagkatapos ng deployment?
**A**: Suriin:
1. Kumpleto ba ang deployment nang matagumpay
2. Gumagana ang application (suriin ang mga logs sa Azure portal)
3. Pinapayagan ng network security groups ang traffic
4. Tama ang pagkaka-configure ng DNS/custom domains

---

## Gastos & Pagsingil

### Q: Magkano ang gugugulin ng mga azd deployment?
**A**: Nakadepende ang mga gastos sa:
- Mga Azure service na dine-deploy
- Mga service tier/SKU na pinili
- Pagkakaiba sa presyo sa bawat rehiyon
- Mga pattern ng paggamit

Gamitin ang [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) para sa mga pagtatantya.

### Q: Paano ko makokontrol ang mga gastos sa mga azd deployment?
**A**: 
1. Gumamit ng mas mababang-tier na SKU para sa mga development environment
2. Mag-set up ng mga budget at alerto sa Azure
3. Gamitin ang `azd down` para alisin ang mga resource kapag hindi kailangan
4. Pumili ng angkop na rehiyon (nag-iiba ang presyo batay sa lokasyon)
5. Gamitin ang Azure Cost Management tools

### Q: Mayroon bang libreng tier na mga opsyon para sa mga template ng azd?
**A**: Maraming Azure service ang nag-aalok ng libreng tier:
- App Service: May libreng tier
- Azure Functions: 1M libreng executions/buwan
- Cosmos DB: Libreng tier na may 400 RU/s
- Application Insights: Unang 5GB/buwan libre

I-configure ang mga template upang gumamit ng libreng tier kung available.

### Q: Paano ko tantiyahin ang mga gastos bago ang deployment?
**A**: 
1. Suriin ang `main.bicep` ng template para makita kung anong mga resource ang nililikha
2. Gamitin ang Azure Pricing Calculator na may partikular na mga SKU
3. Mag-deploy muna sa isang development environment para subaybayan ang aktwal na gastos
4. Gamitin ang Azure Cost Management para sa detalyadong pagsusuri ng gastos

---

## Pinakamahusay na Kasanayan

### Q: Ano ang mga pinakamahusay na kasanayan para sa istraktura ng proyekto ng azd?
**A**: 
1. Panatilihing hiwalay ang code ng application mula sa imprastruktura
2. Gumamit ng makahulugang mga pangalan ng serbisyo sa `azure.yaml`
3. Magpatupad ng wastong error handling sa build scripts
4. Gumamit ng environment-specific na konfigurasyon
5. Isama ang komprehensibong dokumentasyon

### Q: Paano ko dapat i-organisa ang maraming serbisyo sa azd?
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
**A**: **Hindi!** Naglalaman ang `.azure` folder ng sensitibong impormasyon. Idagdag ito sa `.gitignore`:
```gitignore
.azure/
```

### Q: Paano ko hinahandle ang mga secret at sensitibong konfigurasyon?
**A**: 
1. Gumamit ng Azure Key Vault para sa mga secret
2. I-reference ang mga secret ng Key Vault sa konfigurasyon ng application
3. Huwag kailanman i-commit ang mga secret sa version control
4. Gumamit ng managed identities para sa authentication ng service-to-service

### Q: Ano ang inirerekomendang paraan para sa CI/CD gamit ang azd?
**A**: 
1. Gumamit ng hiwalay na environment para sa bawat yugto (dev/staging/prod)
2. Magpatupad ng automated testing bago mag-deploy
3. Gumamit ng mga service principal para sa authentication
4. I-store ang sensitibong konfigurasyon sa pipeline secrets/variables
5. Magpatupad ng approval gates para sa production deployments

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
1. Gamitin ang mga utos ng azd sa umiiral na mga pipeline script
2. Istandardisahin ang paggamit ng azd templates sa buong mga team
3. I-integrate sa umiiral na monitoring at alerting
4. Gamitin ang JSON output ng azd para sa integrasyon sa pipeline

### Q: Maaari ko bang gamitin ang azd sa Azure DevOps?
**A**: Oo, gumagana ang azd sa anumang CI/CD system. Lumikha ng mga Azure DevOps pipeline na gumagamit ng mga utos ng azd.

### Q: Paano ako makakatulong sa azd o lumikha ng mga template ng komunidad?
**A**:
1. **azd tool**: Mag-ambag sa [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Gumawa ng mga template alinsunod sa [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **Documentation**: Mag-ambag sa dokumentasyon sa [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Tanong: Ano ang roadmap para sa azd?
**Sagot**: Suriin ang [official roadmap](https://github.com/Azure/azure-dev/projects) para sa mga planadong feature at pagpapabuti.

### Tanong: Paano ako maglilipat mula sa ibang deployment tools papunta sa azd?
**Sagot**: 
1. Suriin ang kasalukuyang arkitektura ng deployment
2. Gumawa ng katumbas na mga Bicep template
3. I-configure ang `azure.yaml` upang tumugma sa kasalukuyang mga serbisyo
4. Subukin nang mabuti sa development environment
5. Dahan-dahang ilipat ang mga kapaligiran

---

## May Mga Katanungan Pa?

### **Maghanap Muna**
- Suriin ang [official documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Maghanap sa [mga isyu sa GitHub](https://github.com/Azure/azure-dev/issues) para sa katulad na mga problema

### **Humingi ng Tulong**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suporta ng komunidad
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Mga teknikal na tanong
- [Azure Discord](https://discord.gg/azure) - Real-time na chat ng komunidad

### **Iulat ang mga Isyu**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Mga ulat ng bug at mga kahilingan para sa tampok
- Isama ang mga kaugnay na log, mga mensahe ng error, at mga hakbang para ma-reproduce

### **Matuto Pa**
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Ang FAQ na ito ay regular na ina-update. Huling na-update: Setyembre 9, 2025*

---

**Navigasyon**
- **Nakaraang Aralin**: [Glosaryo](glossary.md)
- **Susunod na Aralin**: [Gabay sa Pag-aaral](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang AI na serbisyo ng pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi eksaktong paglalahad. Ang orihinal na dokumento sa orihinal nitong wika ay dapat ituring na opisyal na sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin na isinagawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->