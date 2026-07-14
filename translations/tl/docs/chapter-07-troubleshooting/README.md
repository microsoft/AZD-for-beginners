# Kabanata 7: Pag-troubleshoot at Pag-debug

**📚 Kurso**: [AZD Para sa mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Lalim ng Kaalaman**: Intermediate

---

## Pangkalahatang-ideya

Tinutulungan ka ng kabanatang ito na masuri at malutas ang mga karaniwang isyu kapag nagtatrabaho gamit ang Azure Developer CLI. Mula sa mga pagkabigo sa deployment hanggang sa mga problema na specific sa AI.

> Napatunayan gamit ang `azd 1.27.1` noong Hulyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Masuri ang mga karaniwang pagkabigo sa AZD deployment
- I-debug ang mga isyu sa authentication at permiso
- Malutas ang mga problema sa koneksyon sa serbisyo ng AI
- Gamitin ang Azure Portal at CLI para sa pag-troubleshoot

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Karaniwang Isyu](common-issues.md) | Mga madalas na problemang nararanasan | 30 min |
| 2 | [Gabay sa Pag-debug](debugging.md) | Pahinga-hakbang na mga estratehiya sa pag-debug | 45 min |
| 3 | [Pag-troubleshoot ng AI](ai-troubleshooting.md) | Mga isyung specific sa AI | 30 min |

---

## 🚨 Mabilisang Pag-aayos

### Mga Isyu sa Authentication
```bash
# Kinakailangan para sa mga workflow ng AZD
azd auth login

# Opsyonal kung direkta ka ring gumagamit ng mga utos ng Azure CLI
az login

azd auth status
```

### Mga Pagkabigo sa Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Mga Salungatan sa Resource
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Lumagpas sa Quota
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Sanggunian sa Error Code

| Error | Sanhi | Solusyon |
|-------|-------|----------|
| `AuthenticationError` | Hindi naka-login | `azd auth login` |
| `ResourceNotFound` | Nawawalang resource | Suriin ang mga pangalan ng resource |
| `QuotaExceeded` | Limitasyon sa subscription | Humiling ng pagtaas ng quota |
| `InvalidTemplate` | Mali sa syntax ng Bicep | `az bicep build` |
| `Conflict` | Naka-exist na resource | Gumamit ng bagong pangalan o burahin |
| `Forbidden` | Kulang sa permiso | Suriin ang mga RBAC roles |

---

## 🔄 I-reset at Pagbawi

```bash
# Malambot na reset (panatilihin ang mga resources, muling i-deploy ang code)
azd deploy --force

# Matigas na reset (burahin lahat, magsimula ng bago)
azd down --force --purge
azd up
```

---

## 🔗 Pag-navigate

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 6: Bago ang Deployment](../chapter-06-pre-deployment/README.md) |
| **Susunod** | [Kabanata 8: Produksyon](../chapter-08-production/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Mga Check bago ang Deployment](../chapter-06-pre-deployment/preflight-checks.md)
- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Mga Isyu sa AZD GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->