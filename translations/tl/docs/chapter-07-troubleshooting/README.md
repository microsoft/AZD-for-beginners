# Kabanata 7: Pag-troubleshoot at Pag-debug

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 hours | **⭐ Kompleksidad**: Katamtaman

---

## Pangkalahatang-ideya

Tinutulungan ka ng kabanatang ito na i-diagnose at lutasin ang mga karaniwang isyu kapag nagtatrabaho gamit ang Azure Developer CLI. Mula sa mga pagkabigo sa deployment hanggang sa mga problemang partikular sa AI.

> Napatunayan gamit ang `azd 1.25.6` noong Hunyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagkumpleto ng kabanatang ito, magagawa mong:
- I-diagnose ang mga karaniwang pagkabigo sa AZD deployment
- I-debug ang mga isyu sa authentication at pahintulot
- Lutasin ang mga problema sa konektividad ng AI service
- Gumamit ng Azure Portal at CLI para sa pag-troubleshoot

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Karaniwang Isyu](common-issues.md) | Karaniwang nararanasang mga problema | 30 min |
| 2 | [Gabay sa Pag-debug](debugging.md) | Hakbang-hakbang na mga estratehiya sa pag-debug | 45 min |
| 3 | [Pag-troubleshoot ng AI](ai-troubleshooting.md) | Mga isyu na partikular sa AI | 30 min |

---

## 🚨 Mabilis na Pag-aayos

### Mga Isyu sa Pagpapatunay
```bash
# Kinakailangan para sa mga workflow ng AZD
azd auth login

# Opsyonal kung direktang gumagamit ka rin ng mga utos ng Azure CLI
az login

azd auth status
```

### Mga Pagkabigo sa Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Mga Konflikto ng Resource
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Lumampas sa Quota
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Sanggunian ng Mga Error Code

| Error | Sanhi | Solusyon |
|-------|-------|----------|
| `AuthenticationError` | Hindi naka-log in | `azd auth login` |
| `ResourceNotFound` | Nawawalang resource | Suriin ang mga pangalan ng resource |
| `QuotaExceeded` | Mga limitasyon ng subscription | Humiling ng pagtaas ng quota |
| `InvalidTemplate` | Error sa sintaks ng Bicep | `az bicep build` |
| `Conflict` | Umiiral na resource | Gumamit ng bagong pangalan o tanggalin |
| `Forbidden` | Kulang sa mga permiso | Suriin ang mga RBAC role |

---

## 🔄 Pag-reset at Pag-recover

```bash
# Banayad na pag-reset (panatilihin ang mga resources, muling i-deploy ang kodigo)
azd deploy --force

# Kompletong pag-reset (tanggalin ang lahat, magsimula muli)
azd down --force --purge
azd up
```

---

## 🔗 Navigasyon

| Direction | Chapter |
|-----------|---------|
| **Nakaraan** | [Kabanata 6: Bago ang Pag-deploy](../chapter-06-pre-deployment/README.md) |
| **Susunod** | [Kabanata 8: Produksyon](../chapter-08-production/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Mga Pagsusuri Bago ang Pag-deploy](../chapter-06-pre-deployment/preflight-checks.md)
- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [Mga Isyu sa AZD GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->