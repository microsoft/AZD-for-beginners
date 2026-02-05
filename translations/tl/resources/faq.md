# Mga Madalas Itanong (FAQ)

**Humingi ng Tulong Ayon sa Kabanata**
- **📚 Course Home**: [AZD Para sa Mga Baguhan](../README.md)
- **🚆 Mga Isyu sa Pag-install**: [Kabanata 1: Pag-install at Setup](../docs/getting-started/installation.md)
- **🤖 Mga Tanong Tungkol sa AI**: [Kabanata 2: AI-First Development](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Pag-aayos ng Problema**: [Kabanata 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Panimula

Ang komprehensibong FAQ na ito ay nagbibigay ng sagot sa mga karaniwang tanong tungkol sa Azure Developer CLI (azd) at mga deployment sa Azure. Makakahanap ka ng mabilis na solusyon sa mga karaniwang problema, mauunawaan ang mga pinakamahusay na kasanayan, at magkakaroon ng kaliwanagan sa mga konsepto at workflow ng azd.

## Mga Layunin sa Pag-aaral

Sa pamamagitan ng pagsusuri sa FAQ na ito, ikaw ay:
- Makakahanap ng mabilis na sagot sa mga karaniwang tanong at isyu tungkol sa Azure Developer CLI
- Mauunawaan ang mga pangunahing konsepto at terminolohiya sa pamamagitan ng praktikal na format ng Q&A
- Makakakuha ng mga solusyon sa troubleshooting para sa mga madalas na problema at senaryo ng error
- Matututo ng mga pinakamahusay na kasanayan sa pamamagitan ng mga tanong tungkol sa optimization
- Matutuklasan ang mga advanced na tampok at kakayahan sa pamamagitan ng mga tanong na pang-eksperto
- Magagamit ang gabay sa gastos, seguridad, at deployment strategy nang epektibo

## Mga Resulta sa Pag-aaral

Sa regular na paggamit ng FAQ na ito, ikaw ay:
- Makakapag-ayos ng mga karaniwang isyu sa Azure Developer CLI nang mag-isa gamit ang mga ibinigay na solusyon
- Makakagawa ng mas maalam na desisyon tungkol sa mga deployment strategy at configuration
- Mauunawaan ang relasyon ng azd sa iba pang mga tool at serbisyo ng Azure
- Makakapagpatupad ng mga pinakamahusay na kasanayan batay sa karanasan ng komunidad at rekomendasyon ng mga eksperto
- Makakapag-troubleshoot ng mga problema sa authentication, deployment, at configuration nang epektibo
- Mai-optimize ang gastos at performance gamit ang mga insight at rekomendasyon mula sa FAQ

## Talaan ng Nilalaman

- [Pagsisimula](../../../resources)
- [Authentication at Access](../../../resources)
- [Mga Template at Proyekto](../../../resources)
- [Deployment at Infrastructure](../../../resources)
- [Configuration at Mga Kapaligiran](../../../resources)
- [Pag-aayos ng Problema](../../../resources)
- [Gastos at Pagsingil](../../../resources)
- [Mga Pinakamahusay na Kasanayan](../../../resources)
- [Mga Advanced na Paksa](../../../resources)

---

## Pagsisimula

### T: Ano ang Azure Developer CLI (azd)?
**S**: Ang Azure Developer CLI (azd) ay isang tool na nakatuon sa mga developer na nagpapabilis sa oras ng paglipat ng iyong application mula sa lokal na development environment patungo sa Azure. Nagbibigay ito ng mga pinakamahusay na kasanayan sa pamamagitan ng mga template at tumutulong sa buong lifecycle ng deployment.

### T: Paano naiiba ang azd sa Azure CLI?
**S**: 
- **Azure CLI**: Pangkalahatang tool para sa pamamahala ng mga resource sa Azure
- **azd**: Tool na nakatuon sa mga developer para sa mga workflow ng application deployment
- Ginagamit ng azd ang Azure CLI sa loob ngunit nagbibigay ng mas mataas na antas ng abstraction para sa mga karaniwang senaryo ng development
- Kasama sa azd ang mga template, pamamahala ng kapaligiran, at automation ng deployment

### T: Kailangan ko bang naka-install ang Azure CLI para magamit ang azd?
**S**: Oo, kailangan ng azd ang Azure CLI para sa authentication at ilang operasyon. I-install muna ang Azure CLI, pagkatapos ay i-install ang azd.

### T: Anong mga programming language ang sinusuportahan ng azd?
**S**: Ang azd ay language-agnostic. Gumagana ito sa:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Mga static na website
- Mga containerized na application

### T: Maaari ko bang gamitin ang azd sa mga umiiral na proyekto?
**S**: Oo! Maaari kang:
1. Gumamit ng `azd init` para magdagdag ng azd configuration sa mga umiiral na proyekto
2. I-adapt ang mga umiiral na proyekto upang tumugma sa istruktura ng azd template
3. Gumawa ng mga custom na template batay sa iyong umiiral na arkitektura

---

## Authentication at Access

### T: Paano ako mag-aauthenticate sa Azure gamit ang azd?
**S**: Gumamit ng `azd auth login` na magbubukas ng browser window para sa authentication sa Azure. Para sa mga CI/CD scenario, gumamit ng service principals o managed identities.

### T: Maaari ko bang gamitin ang azd sa maraming Azure subscription?
**S**: Oo. Gumamit ng `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` para tukuyin kung aling subscription ang gagamitin para sa bawat kapaligiran.

### T: Anong mga permiso ang kailangan ko para mag-deploy gamit ang azd?
**S**: Karaniwang kailangan mo ng:
- **Contributor** role sa resource group o subscription
- **User Access Administrator** kung nagde-deploy ng mga resource na nangangailangan ng role assignments
- Ang mga partikular na permiso ay nag-iiba depende sa template at mga resource na ide-deploy

### T: Maaari ko bang gamitin ang azd sa CI/CD pipelines?
**S**: Oo! Ang azd ay dinisenyo para sa CI/CD integration. Gumamit ng service principals para sa authentication at mag-set ng environment variables para sa configuration.

### T: Paano ko hahawakan ang authentication sa GitHub Actions?
**S**: Gumamit ng Azure Login action gamit ang service principal credentials:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mga Template at Proyekto

### T: Saan ko mahahanap ang mga azd template?
**S**: 
- Mga opisyal na template: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Mga template mula sa komunidad: Maghanap sa GitHub ng "azd-template"
- Gumamit ng `azd template list` para mag-browse ng mga available na template

### T: Paano ako gagawa ng custom na template?
**S**: 
1. Magsimula sa umiiral na istruktura ng template
2. I-modify ang `azure.yaml`, mga infrastructure file, at application code
3. Subukan nang mabuti gamit ang `azd up`
4. I-publish sa GitHub na may tamang mga tag

### T: Maaari ko bang gamitin ang azd nang walang template?
**S**: Oo, gumamit ng `azd init` sa isang umiiral na proyekto para gumawa ng kinakailangang configuration files. Kailangan mong mano-manong i-configure ang `azure.yaml` at mga infrastructure file.

### T: Ano ang pagkakaiba ng opisyal at community templates?
**S**: 
- **Opisyal na template**: Pinapanatili ng Microsoft, regular na ina-update, may komprehensibong dokumentasyon
- **Community templates**: Ginawa ng mga developer, maaaring may espesyal na use cases, nag-iiba ang kalidad at maintenance

### T: Paano ko ia-update ang template sa aking proyekto?
**S**: Ang mga template ay hindi awtomatikong ina-update. Maaari kang:
1. Mano-manong magkumpara at mag-merge ng mga pagbabago mula sa source template
2. Magsimula muli gamit ang `azd init` gamit ang updated na template
3. Mag-cherry-pick ng mga partikular na improvement mula sa updated templates

---

## Deployment at Infrastructure

### T: Anong mga serbisyo ng Azure ang maaaring i-deploy ng azd?
**S**: Ang azd ay maaaring mag-deploy ng anumang serbisyo ng Azure sa pamamagitan ng Bicep/ARM templates, kabilang ang:
- App Services, Container Apps, Functions
- Databases (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Networking, security, at monitoring resources

### T: Maaari ba akong mag-deploy sa maraming rehiyon?
**S**: Oo, i-configure ang maraming rehiyon sa iyong Bicep templates at itakda ang location parameter nang naaayon para sa bawat kapaligiran.

### T: Paano ko hahawakan ang database schema migrations?
**S**: Gumamit ng deployment hooks sa `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### T: Maaari ba akong mag-deploy ng infrastructure lang nang walang applications?
**S**: Oo, gumamit ng `azd provision` para mag-deploy ng mga infrastructure component lang na tinukoy sa iyong mga template.

### T: Paano ako mag-deploy sa mga umiiral na resource ng Azure?
**S**: Ito ay medyo kumplikado at hindi direktang sinusuportahan. Maaari kang:
1. Mag-import ng mga umiiral na resource sa iyong Bicep templates
2. Gumamit ng mga umiiral na resource references sa templates
3. I-modify ang templates para conditionally gumawa o mag-refer sa mga resource

### T: Maaari ko bang gamitin ang Terraform sa halip na Bicep?
**S**: Sa kasalukuyan, pangunahing sinusuportahan ng azd ang Bicep/ARM templates. Ang suporta para sa Terraform ay hindi opisyal na available, bagaman maaaring may mga solusyon mula sa komunidad.

---

## Configuration at Mga Kapaligiran

### T: Paano ko pamamahalaan ang iba't ibang kapaligiran (dev, staging, prod)?
**S**: Gumawa ng hiwalay na mga kapaligiran gamit ang `azd env new <environment-name>` at i-configure ang iba't ibang settings para sa bawat isa:
```bash
azd env new development
azd env new staging  
azd env new production
```

### T: Saan naka-store ang mga configuration ng kapaligiran?
**S**: Sa `.azure` folder sa loob ng iyong project directory. Ang bawat kapaligiran ay may sariling folder na may mga configuration file.

### T: Paano ko ise-set ang environment-specific configuration?
**S**: Gumamit ng `azd env set` para mag-configure ng environment variables:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### T: Maaari ko bang i-share ang mga configuration ng kapaligiran sa mga miyembro ng team?
**S**: Ang `.azure` folder ay naglalaman ng sensitibong impormasyon at hindi dapat i-commit sa version control. Sa halip:
1. I-dokumento ang mga kinakailangang environment variables
2. Gumamit ng deployment scripts para mag-set up ng mga kapaligiran
3. Gumamit ng Azure Key Vault para sa sensitibong configuration

### T: Paano ko i-ooverride ang mga default ng template?
**S**: Mag-set ng environment variables na tumutugma sa mga parameter ng template:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Pag-aayos ng Problema

### T: Bakit nabigo ang `azd up`?
**S**: Mga karaniwang sanhi:
1. **Authentication issues**: Patakbuhin ang `azd auth login`
2. **Insufficient permissions**: Suriin ang iyong Azure role assignments
3. **Resource naming conflicts**: Palitan ang AZURE_ENV_NAME
4. **Quota/capacity issues**: Suriin ang regional availability
5. **Template errors**: I-validate ang Bicep templates

### T: Paano ko i-debug ang mga deployment failure?
**S**: 
1. Gumamit ng `azd deploy --debug` para sa verbose output
2. Suriin ang Azure portal deployment history
3. I-review ang Activity Log sa Azure portal
4. Gumamit ng `azd show` para ipakita ang kasalukuyang estado ng kapaligiran

### T: Bakit hindi gumagana ang aking environment variables?
**S**: Suriin:
1. Ang mga pangalan ng variable ay eksaktong tumutugma sa mga parameter ng template
2. Ang mga value ay maayos na naka-quote kung may mga space
3. Ang kapaligiran ay napili: `azd env select <environment>`
4. Ang mga variable ay naka-set sa tamang kapaligiran

### T: Paano ko lilinisin ang mga nabigong deployment?
**S**: 
```bash
azd down --force --purge
```
Tatanggalin nito ang lahat ng resources at configuration ng kapaligiran.

### T: Bakit hindi ma-access ang aking application pagkatapos ng deployment?
**S**: Suriin:
1. Ang deployment ay matagumpay na natapos
2. Ang application ay tumatakbo (suriin ang logs sa Azure portal)
3. Ang network security groups ay pinapayagan ang traffic
4. Ang DNS/custom domains ay maayos na naka-configure

---

## Gastos at Pagsingil

### T: Magkano ang gastos ng azd deployments?
**S**: Ang gastos ay nakadepende sa:
- Mga serbisyo ng Azure na ide-deploy
- Mga tier/SKU ng serbisyo na napili
- Pagkakaiba sa regional pricing
- Mga pattern ng paggamit

Gamitin ang [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) para sa mga pagtatantya.

### T: Paano ko makokontrol ang gastos sa azd deployments?
**S**: 
1. Gumamit ng mas mababang-tier na SKUs para sa development environments
2. Mag-set up ng Azure budgets at alerts
3. Gumamit ng `azd down` para tanggalin ang mga resource kapag hindi kailangan
4. Pumili ng naaangkop na rehiyon (nag-iiba ang gastos depende sa lokasyon)
5. Gumamit ng Azure Cost Management tools

### T: May mga free tier options ba para sa azd templates?
**S**: Maraming serbisyo ng Azure ang nag-aalok ng free tiers:
- App Service: May free tier
- Azure Functions: 1M free executions/buwan
- Cosmos DB: Free tier na may 400 RU/s
- Application Insights: Unang 5GB/buwan libre

I-configure ang mga template upang gamitin ang free tiers kung available.

### T: Paano ko i-eestimate ang gastos bago ang deployment?
**S**: 
1. I-review ang `main.bicep` ng template para makita kung anong mga resource ang gagawin
2. Gumamit ng Azure Pricing Calculator na may partikular na SKUs
3. Mag-deploy muna sa development environment para i-monitor ang aktwal na gastos
4. Gumamit ng Azure Cost Management para sa detalyadong pagsusuri ng gastos

---

## Mga Pinakamahusay na Kasanayan

### T: Ano ang mga pinakamahusay na kasanayan para sa istruktura ng azd project?
**S**: 
1. Panatilihing hiwalay ang application code mula sa infrastructure
2. Gumamit ng makabuluhang pangalan ng serbisyo sa `azure.yaml`
3. Magpatupad ng tamang error handling sa build scripts
4. Gumamit ng environment-specific configuration
5. Isama ang komprehensibong dokumentasyon

### T: Paano ko dapat ayusin ang maraming serbisyo sa azd?
**S**: Gumamit ng inirerekomendang istruktura:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### T: Dapat ko bang i-commit ang `.azure` folder sa version control?
**S**: **Hindi!** Ang `.azure` folder ay naglalaman ng sensitibong impormasyon. Idagdag ito sa `.gitignore`:
```gitignore
.azure/
```

### T: Paano ko hahawakan ang mga secrets at sensitibong configuration?
**S**: 
1. Gumamit ng Azure Key Vault para sa mga secrets
2. I-refer ang mga Key Vault secrets sa application configuration
3. Huwag kailanman i-commit ang mga secrets sa version control
4. Gumamit ng managed identities para sa service-to-service authentication

### T: Ano ang inirerekomendang approach para sa CI/CD gamit ang azd?
**S**: 
1. Gumamit ng hiwalay na kapaligiran para sa bawat stage (dev/staging/prod)
2. Magpatupad ng automated testing bago ang deployment
3. Gumamit ng service principals para sa authentication
4. I-store ang sensitibong configuration sa pipeline secrets/variables
5. Magpatupad ng approval gates para sa production deployments

---

## Mga Advanced na Paksa

### T: Maaari ko bang i-extend ang azd gamit ang custom na functionality?
**S**: Oo, sa pamamagitan ng deployment hooks sa `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### T: Paano ko i-integrate ang azd sa umiiral na DevOps processes?
**S**: 
1. Gumamit ng azd commands sa umiiral na pipeline scripts
2. Mag-standardize sa azd templates sa buong team
3. I-integrate sa umiiral na monitoring at alerting
4. Gumamit ng JSON output ng azd para sa pipeline integration

### T: Maaari ko bang gamitin ang azd sa Azure DevOps?
**S**: Oo, gumagana ang azd sa anumang CI/CD system. Gumawa ng Azure DevOps pipelines na gumagamit ng azd commands.

### T: Paano ako makakapag-ambag sa azd o gumawa ng community templates?
**S**: 
1. **azd tool**: Mag-ambag sa [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mga Template**: Gumawa ng mga template ayon sa [mga patnubay sa template](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentasyon**: Mag-ambag sa mga dokumento sa [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### T: Ano ang roadmap para sa azd?  
**S**: Tingnan ang [opisyal na roadmap](https://github.com/Azure/azure-dev/projects) para sa mga nakaplanong tampok at pagpapabuti.  

### T: Paano ako lilipat mula sa ibang deployment tools papunta sa azd?  
**S**:  
1. Suriin ang kasalukuyang deployment architecture  
2. Gumawa ng katumbas na mga Bicep template  
3. I-configure ang `azure.yaml` upang tumugma sa kasalukuyang mga serbisyo  
4. Subukan nang mabuti sa development environment  
5. Dahan-dahang ilipat ang mga environment  

---

## May mga tanong pa?  

### **Maghanap Muna**  
- Tingnan ang [opisyal na dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Maghanap ng [mga isyu sa GitHub](https://github.com/Azure/azure-dev/issues) para sa mga katulad na problema  

### **Humingi ng Tulong**  
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Suporta mula sa komunidad  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Mga teknikal na tanong  
- [Azure Discord](https://discord.gg/azure) - Real-time na chat ng komunidad  

### **Mag-ulat ng mga Isyu**  
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Mga ulat ng bug at mga kahilingan para sa tampok  
- Isama ang mga kaugnay na log, mga mensahe ng error, at mga hakbang para maulit ang problema  

### **Matuto Pa**  
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Ang FAQ na ito ay regular na ina-update. Huling na-update: Setyembre 9, 2025*  

---

**Pag-navigate**  
- **Nakaraang Aralin**: [Glossary](glossary.md)  
- **Susunod na Aralin**: [Study Guide](study-guide.md)  

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.