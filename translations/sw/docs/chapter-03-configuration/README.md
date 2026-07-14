# Sura ya 3: Uundaji & Uthibitishaji

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Dakika 45-60 | **⭐ Ugumu**: Kiwango cha Kati

---

## Muhtasari

Sura hii inahusu usanidi wa mazingira, mifumo ya uthibitishaji, na mbinu bora za usalama kwa utoaji wa Azure Developer CLI.

> Imehakikiwa dhidi ya `azd 1.27.1` mwezi Julai 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Kumjua mtawanyiko wa usanidi wa AZD
- Kusimamia mazingira mbalimbali (dev, staging, prod)
- Kutekeleza uthibitishaji salama kwa vitambulisho vilivyosimamiwa
- Kusanidi mipangilio ya mazingira maalum

---

## 📚 Somo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Mwongozo wa Usanidi](configuration.md) | Kuandaa na kusimamia mazingira | Dakika 30 |
| 2 | [Uthibitishaji & Usalama](authsecurity.md) | Mfumo wa utambulisho uliofikiwa na RBAC | Dakika 30 |

---

## 🚀 Anza Haraka

```bash
# Unda mazingira mengi
azd env new dev
azd env new staging
azd env new prod

# Badilisha mazingira
azd env select prod

# Weka mabadiliko ya mazingira
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Tazama usanidi
azd env get-values
```

---

## 🔧 Mtawanyiko wa Usanidi

AZD hutumia mipangilio kwa mpangilio huu (baadaye huvuka ya awali):

1. **Thamani za msingi** (zilizo katika templeti)
2. **azure.yaml** (usanidi wa mradi)
3. **Mazingira ya vigezo** (`azd env set`)
4. **Bendera za mstari wa amri** (`--location eastus`)

---

## 🔐 Mbinu Bora za Usalama

```bash
# Tumia utambulisho ulioendeshwa (linapendekezwa)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Angalia hali ya uthibitishaji ya AZD
azd auth status

# Hiari: hakiki muktadha wa Azure CLI ikiwa unapanga kuendesha amri za az
az account show

# Thibitisha tena ikiwa inahitajika
azd auth login

# Hiari: sasisha uthibitishaji wa Azure CLI kwa amri za az
az login
```

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura ya 2: Maendeleo ya AI](../chapter-02-ai-development/README.md) |
| **Inayofuata** | [Sura ya 4: Miundombinu](../chapter-04-infrastructure/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Utoaji](../chapter-06-pre-deployment/README.md)
- [Kutatua Matatizo](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->