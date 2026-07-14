# Sura ya 1: Msingi & Anza Haraka

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Dakika 30-45 | **⭐ Ugumu**: Maanzilishi

---

## Muhtasari

Sura hii inatambulisha misingi ya Azure Developer CLI (azd). Utajifunza dhana kuu, kusanidi zana, na kuweka programu yako ya kwanza kwenye Azure.

> Imethibitishwa dhidi ya `azd 1.27.1` mwezi Julai 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa na uwezo wa:
- Elewa Azure Developer CLI ni nini na jinsi inavyotofautiana na Azure CLI
- Sakinisha na usanidi AZD kwenye jukwaa lako
- Weka programu yako ya kwanza kwenye Azure kwa kutumia `azd up`
- Safisha rasilimali kwa kutumia `azd down`

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Misingi ya AZD](azd-basics.md) | Dhana kuu, istilahi, na muundo wa mradi | Dakika 15 |
| 2 | [Usakinishaji & Usanidi](installation.md) | Maagizo ya usakinishaji maalum kwa jukwaa | Dakika 10 |
| 3 | [Mradi Wako wa Kwanza](first-project.md) | Mazoezi: Tuma programu ya wavuti kwenye Azure | Dakika 20 |
| 4 | [Leta Programu Yako](bring-your-own-app.md) | Ongeza azd kwenye mradi uliopo tayari | Dakika 15 |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Mazingira yanayoweza kurudiwa kwa azd kwa kutumia kontena za maendeleo | Dakika 15 |

---

## ✅ Anza Hapa: Thibitisha Usanidi Wako

Kabla ya kuanza, thibitisha kwamba kompyuta yako ya ndani iko tayari kwa kiolezo cha Sura ya 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ikiwa script inaripoti zana zilizokosekana, rekebisha hizo kwanza kisha endelea na sura.

---

## 🚀 Anza Haraka

```bash
# Angalia usakinishaji
azd version

# Thibitisha kwa ajili ya AZD
# Hiari: az login ikiwa unapanga kuendesha amri za Azure CLI moja kwa moja
azd auth login

# Sambaza programu yako ya kwanza
azd init --template todo-nodejs-mongo
azd up

# Safisha baada ya kumaliza
azd down --force --purge
```

---

## ✅ Vigezo vya Mafanikio

Baada ya kumaliza sura hii, unapaswa kuwa na uwezo wa:

```bash
azd version              # Inaonyesha toleo lililosakinishwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                   # Inaweka kwenye Azure
azd show                 # Inaonyesha URL ya programu inayokimbia
azd down --force --purge # Inasafisha rasilimali
```

---

## 🔗 Mwongozo wa Kuenda

| Mwelekeo | Sura |
|-----------|---------|
| **Ifuatayo** | [Sura ya 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/README.md) |
| **Ruka kwa** | [Sura ya 3: Usanidi](../chapter-03-configuration/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Karatasi ya Amri ya Kushika](../../resources/cheat-sheet.md)
- [Maswali Yanayoulizwa Mara kwa Mara (FAQ)](../../resources/faq.md)
- [Kamusi](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->