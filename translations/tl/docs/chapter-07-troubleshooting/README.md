# Kabanata 7: Pag-troubleshoot at Pag-debug

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 oras | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Tinutulungan ka ng kabanatang ito na suriin at lutasin ang mga karaniwang isyu kapag nagtatrabaho gamit ang Azure Developer CLI. Mula sa mga pagkabigo sa deployment hanggang sa mga isyung nauugnay sa AI.

> Validated against `azd 1.23.12` noong Marso 2026.

## Mga Layunin sa Pagkatuto

Sa pagkumpleto ng kabanatang ito, magagawa mo:
- Masuri ang mga karaniwang pagkabigo sa AZD deployment
- I-debug ang mga isyu sa authentication at permiso
- Lutasin ang mga problema sa konektividad ng AI service
- Gamitin ang Azure Portal at CLI para sa troubleshooting

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Karaniwang Mga Isyu](common-issues.md) | Mga madalas na nararanasang problema | 30 min |
| 2 | [Gabay sa Pag-debug](debugging.md) | Mga hakbang-hakbang na estratehiya sa pag-debug | 45 min |
| 3 | [Pag-troubleshoot ng AI](ai-troubleshooting.md) | Mga isyung nauugnay sa AI | 30 min |

---

## 🚨 Mabilisang Pag-aayos

### Mga Isyu sa Pagpapatunay
```bash
# Kinakailangan para sa mga workflow ng AZD
azd auth login

# Opsyonal kung direktang gumagamit ka rin ng mga Azure CLI na utos
az login

azd auth status
```

### Mga Pagkabigo sa Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Mga Konflikto sa Resource
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
| `ResourceNotFound` | Walang nasabing resource | Suriin ang mga pangalan ng resource |
| `QuotaExceeded` | Mga limitasyon ng subscription | Humiling ng pagtaas ng quota |
| `InvalidTemplate` | Error sa sintaks ng Bicep | `az bicep build` |
| `Conflict` | May umiiral na resource | Gumamit ng bagong pangalan o tanggalin |
| `Forbidden` | Kulang ang mga pahintulot | Suriin ang mga role ng RBAC |

---

## 🔄 Pag-reset at Pag-recover

```bash
# Banayad na pag-reset (panatilihin ang mga resource, muling i-deploy ang code)
azd deploy --force

# Buong pag-reset (burahin ang lahat, magsimula mula sa simula)
azd down --force --purge
azd up
```

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Nakaraan** | [Kabanata 6: Bago ang Pag-deploy](../chapter-06-pre-deployment/README.md) |
| **Susunod** | [Kabanata 8: Produksyon](../chapter-08-production/README.md) |

---

## 📖 Mga Kaugnay na Sanggunian

- [Mga Paunang Pagsusuri Bago Pag-deploy](../chapter-06-pre-deployment/preflight-checks.md)
- [Gabay sa Konfigurasyon](../chapter-03-configuration/configuration.md)
- [AZD Mga Isyu sa GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa katutubong wika nito ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang mga hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->