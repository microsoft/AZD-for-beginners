# Kabanata 7: Pagsasaayos at Pag-debug

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 1-1.5 hours | **⭐ Antas ng Kahirapan**: Katamtaman

---

## Pangkalahatang-ideya

Tinutulungan ka ng kabanatang ito na tuklasin at lutasin ang mga karaniwang isyu kapag gumagamit ng Azure Developer CLI. Mula sa mga pagkabigo sa deployment hanggang sa mga isyung nauugnay sa AI.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Matukoy ang mga karaniwang pagkabigo sa pag-deploy ng AZD
- I-debug ang mga isyu sa pagpapatunay at mga pahintulot
- Lutasin ang mga problema sa konektibidad ng serbisyo ng AI
- Gamitin ang Azure Portal at CLI para sa pag-troubleshoot

---

## 📚 Mga Leksyon

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Karaniwang Mga Isyu](common-issues.md) | Mga karaniwang problema | 30 min |
| 2 | [Gabay sa Pag-debug](debugging.md) | Hakbang-hakbang na mga estratehiya sa pag-debug | 45 min |
| 3 | [Pag-troubleshoot ng AI](ai-troubleshooting.md) | Mga isyung partikular sa AI | 30 min |

---

## 🚨 Mabilisang Pag-aayos

### Mga Isyu sa Pagpapatunay
```bash
azd auth login
az login
azd auth whoami
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

## 📋 Sanggunian ng mga Error Code

| Error | Sanhi | Solusyon |
|-------|-------|----------|
| `AuthenticationError` | Hindi naka-log in | `azd auth login` |
| `ResourceNotFound` | Hindi matagpuan ang resource | Suriin ang mga pangalan ng resource |
| `QuotaExceeded` | Mga limitasyon ng subscription | Humiling ng pagtaas ng quota |
| `InvalidTemplate` | Pagkakamali sa syntax ng Bicep | `az bicep build` |
| `Conflict` | Umiiral na ang resource | Gumamit ng bagong pangalan o i-delete |
| `Forbidden` | Hindi sapat ang mga pahintulot | Suriin ang mga RBAC role |

---

## 🔄 Pag-reset at Pag-recover

```bash
# Banayad na pag-reset (panatilihin ang mga mapagkukunan, muling i-deploy ang kodigo)
azd deploy --force

# Kompletong pag-reset (tanggalin ang lahat, magsimula mula sa simula)
azd down --force --purge
azd up
```

---

## 🔗 Pag-navigate

| Direksyon | Kabanata |
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
Paunawa:
Isinalin ang dokumentong ito gamit ang AI translation service na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa kawastuhan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->