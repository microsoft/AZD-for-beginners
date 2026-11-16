# Kabanata 7: Pag-troubleshoot at Pag-debug

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Antas ng Hirap**: Intermediate

---

## Pangkalahatang-ideya

Tinutulungan ka ng kabanatang ito na tuklasin at lutasin ang mga karaniwang isyu kapag gumagamit ng Azure Developer CLI. Mula sa mga kabiguan sa deployment hanggang sa mga problema na tiyak sa AI.

> Mga gabay sa command na sinuri laban sa inilabas na `azd 1.37.2` na sanggunian. Hindi isinagawa ang mga deployment sa cloud. Palitan ang mga halimbawa ng pangalan ng resource at mga ID bago gamitin ang mga command.

## Mga Layunin sa Pagkatuto

Sa pagtapos ng kabanatang ito, ikaw ay:
- Matutukoy ang mga karaniwang kabiguan sa AZD deployment
- Ma-debug ang mga isyu sa authentication at permiso
- Malulutas ang mga problema sa konektibidad ng AI service
- Magagamit ang Azure Portal at CLI para sa pag-troubleshoot

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Karaniwang Isyu](common-issues.md) | Madalas na nararanasang problema | 30 min |
| 2 | [Gabay sa Pag-debug](debugging.md) | Mga hakbang sa pag-debug | 45 min |
| 3 | [Pag-troubleshoot ng AI](ai-troubleshooting.md) | Mga isyung tiyak sa AI | 30 min |

---

## 🚨 Mga Mabilisang Ayos

### Mga Isyu sa Authentication
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Mga Kabiguan sa Pagprovision
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Mga Konflikto sa Resource
Suriin muna ang umiiral na resource at mga error sa deployment. Huwag tanggalin ang isang shared o production na kapaligiran para lamang ayusin ang naming conflict. Para sa isang **bagong disposable na kapaligiran**, gumamit ng natatanging pangalan:

```bash
azd env new different-name
azd up
```

### Naabot ang Quota
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Ang pagbabago ng `AZURE_LOCATION` ay hindi ililipat ang mga umiiral na resources at maaaring magdulot ng mga location conflict kapag muling na-deploy.

---

## 📋 Sanggunian sa Mga Error Code

| Error | Dahilan | Solusyon |
|-------|---------|----------|
| `AuthenticationError` | Hindi naka-login | `azd auth login` |
| `ResourceNotFound` | Nawawalang resource | Suriin ang mga pangalan ng resource |
| `QuotaExceeded` | Limitasyon sa subscription | Humiling ng pagtaas ng quota |
| `InvalidTemplate` | Mali ang syntax ng Bicep | `az bicep build` |
| `Conflict` | Umiiral na resource | Gumamit ng bagong pangalan o tanggalin |
| `Forbidden` | Hindi sapat ang permiso | Suriin ang mga RBAC role |

---

## 🔄 Pag-reset at Pagbawi

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Ang hard reset ay nagtatanggal ng data at maaaring magbago ng mga endpoint. Mag-backup muna at suriin ang mga prompt para sa interactive na pagtanggal. Ang `--force --purge` ay angkop lamang para sa mga disposable na kapaligiran kapag layunin ang hindi na mababawi pang pagtanggal.

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|----------|
| **Nuna** | [Kabanata 6: Bago ang Deployment](../chapter-06-pre-deployment/README.md) |
| **Susunod** | [Kabanata 8: Produksyon](../chapter-08-production/README.md) |

---

## 📖 Mga Kaugnay na Sanggunian

- [Mga Suriin Bago ang Deployment](../chapter-06-pre-deployment/preflight-checks.md)
- [Gabay sa Pag-configure](../chapter-03-configuration/configuration.md)
- [Mga Isyu sa AZD GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->