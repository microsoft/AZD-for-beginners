# Sura ya 7: Kutatua Matatizo & Kufuatilia Hitilafu

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Saa 1-1.5 | **⭐ Ugumu**: Kiwiliwili

---

## Muhtasari

Sura hii inakusaidia kubaini na kutatua matatizo yanayotokea mara kwa mara unapofanya kazi na Azure Developer CLI. Kuanzia kushindwa kwa usambazaji hadi matatizo maalum ya AI.

> Mwongozo wa amri umeangaliwa dhidi ya marejeleo yaliyotolewa ya `azd 1.37.2`. Usambazaji wa wingu haukuendeshwa. Badilisha majina na vitambulisho vya rasilimali mfano kabla ya kutumia amri.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Kubaini kushindwa kwa usambazaji wa AZD
- Kufuatilia hitilafu za uthibitishaji na ruhusa
- Kutatua matatizo ya muunganisho wa huduma za AI
- Kutumia Azure Portal na CLI kwa ajili ya kutatua matatizo

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Matatizo ya Kawaida](common-issues.md) | Matatizo yanayojitokeza mara kwa mara | Dakika 30 |
| 2 | [Mwongozo wa Kufuatilia Hitilafu](debugging.md) | Mikakati ya kufuatilia hitilafu hatua kwa hatua | Dakika 45 |
| 3 | [Kutatua Matatizo ya AI](ai-troubleshooting.md) | Matatizo maalum ya AI | Dakika 30 |

---

## 🚨 Marekebisho ya Haraka

### Matatizo ya Uthibitishaji
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Kushindwa kwa Utoaji
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Migogoro ya Rasilimali
Kagua rasilimali iliyopo na makosa ya usambazaji kwanza. Usifute mazingira yaliyoshirikiwa au ya uzalishaji ili kutatua mgogoro wa majina. Kwa **mazingira mapya yanayotumika mara moja**, tumia jina la kipekee:

```bash
azd env new different-name
azd up
```

### Kiasi Kimezidiwa
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Kubadilisha `AZURE_LOCATION` hakuhamishi rasilimali zilizopo na kunaweza kusababisha migogoro ya eneo katika usambazaji mpya.

---

## 📋 Marejeleo ya Msimbo wa Hitilafu

| Hitilafu | Sababu | Suluhisho |
|-------|-------|----------|
| `AuthenticationError` | Haujajiingia | `azd auth login` |
| `ResourceNotFound` | Rasilimali haipo | Angalia majina ya rasilimali |
| `QuotaExceeded` | Mipaka ya usajili | Omba ongezeko la kiasi |
| `InvalidTemplate` | Hitilafu ya sentensi ya Bicep | `az bicep build` |
| `Conflict` | Rasilimali ipo | Tumia jina jipya au futa |
| `Forbidden` | Ruhusa zisizotosheka | Angalia majukumu ya RBAC |

---

## 🔄 Weka Upya na Uokoaji

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Weka upya mgumu hufuta data na inaweza kubadilisha vituo. Hifadhi nakala kwanza na pitia maelekezo ya kufuta ya mahiri. `--force --purge` inafaa tu kwa mazingira yanayotumika mara moja wakati kufuta kisizoweza kurekebishwa kunakusudiwa.

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyotangulia** | [Sura ya 6: Kabla ya Usambazaji](../chapter-06-pre-deployment/README.md) |
| **Ifuatayo** | [Sura ya 8: Uzalishaji](../chapter-08-production/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Usambazaji](../chapter-06-pre-deployment/preflight-checks.md)
- [Mwongozo wa Usanidi](../chapter-03-configuration/configuration.md)
- [Matatizo ya AZD GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->