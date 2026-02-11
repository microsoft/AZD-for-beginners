# Sura 3: Usanidi & Uthibitishaji

**📚 Kozi**: [AZD Kwa Waanziaji](../../README.md) | **⏱️ Muda**: 45-60 dakika | **⭐ Ugumu**: Kati

---

## Muhtasari

Sura hii inajumuisha usanidi wa mazingira, mifumo ya uthibitishaji, na mbinu bora za usalama kwa utekelezaji wa Azure Developer CLI.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utaweza:
- Tawala mlolongo wa usanidi wa AZD
- Dhibiti mazingira mengi (dev, staging, prod)
- Tekeleza uthibitishaji salama kwa vitambulisho vinavyosimamiwa
- Sanidi mipangilio maalum ya mazingira

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Mwongozo wa Usanidi](configuration.md) | Usanidi na usimamizi wa mazingira | 30 min |
| 2 | [Uthibitishaji na Usalama](authsecurity.md) | Mifumo ya vitambulisho vinavyosimamiwa na RBAC | 30 min |

---

## 🚀 Anza Haraka

```bash
# Unda mazingira mengi
azd env new dev
azd env new staging
azd env new prod

# Badilisha mazingira
azd env select prod

# Weka vigezo vya mazingira
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Tazama usanidi
azd env get-values
```

---

## 🔧 Mlolongo wa Usanidi

AZD inatumia mipangilio kwa mpangilio huu (baadaye hubadili kile kilichotangulia):

1. **Default values** (vilivyojengwa ndani ya templeti)
2. **azure.yaml** (usanidi wa mradi)
3. **Vigezo vya mazingira** (`azd env set`)
4. **Bendera za mstari wa amri** (`--location eastus`)

---

## 🔐 Mbinu Bora za Usalama

```bash
# Tumia kitambulisho kilichosimamiwa (inayopendekezwa)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Angalia hali ya uthibitishaji
azd auth whoami
az account show

# Thibitisha upya ikiwa inahitajika
azd auth login
az login
```

---

## 🔗 Uelekeo

| Mwelekeo | Sura |
|-----------|---------|
| **Iliyopita** | [Sura 2: Maendeleo ya AI](../chapter-02-ai-development/README.md) |
| **Inayofuata** | [Sura 4: Miundombinu](../chapter-04-infrastructure/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Ukaguzi Kabla ya Utekelezaji](../chapter-06-pre-deployment/README.md)
- [Utatuzi wa Matatizo](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kuepuka dhima:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya awali katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa za muhimu au nyeti, inashauriwa kutumia utafsiri wa mtaalamu wa kibinadamu. Hatuwajibiki kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->