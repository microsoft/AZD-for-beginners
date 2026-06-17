# Sura 1: Misingi & Anza Haraka

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: 30-45 dakika | **⭐ Ugumu**: Msingi

---

## Muhtasari

Sura hii inatambulisha misingi ya Azure Developer CLI (azd). Utajifunza dhana za msingi, kusakinisha zana, na kutuma programu yako ya kwanza kwenye Azure.

> Imekaguliwa dhidi ya `azd 1.25.6` katika Juni 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Elewa Azure Developer CLI ni nini na inavyotofautiana na Azure CLI
- Sakinisha na usanidi AZD kwenye jukwaa lako
- Tuma programu yako ya kwanza kwenye Azure kwa `azd up`
- Safisha rasilimali kwa `azd down`

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [AZD Misingi](azd-basics.md) | Madhumuni ya msingi, istilahi, na muundo wa mradi | 15 dak |
| 2 | [Usanidi & Ufungaji](installation.md) | Mwongozo wa ufungaji maalum kwa kila jukwaa | 10 dak |
| 3 | [Mradi Wako wa Kwanza](first-project.md) | Vitendo: Tuma programu ya wavuti kwenye Azure | 20 dak |
| 4 | [Leta Programu Yako](bring-your-own-app.md) | Ongeza azd kwenye mradi uliopo tayari | 15 dak |
| 5 | [Kontena za Dev & Codespaces](dev-containers.md) | Mazingira ya azd yanayoweza kuzalishwa tena kwa kutumia kontena za dev | 15 dak |

---

## ✅ Anza Hapa: Hakiki Usanidi Wako

Kabla hujaanza, thibitisha kwamba mashine yako ya karibu iko tayari kwa kiolezo cha Sura 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ikiwa skripti itaonyesha zana ambazo hazipo, rekebisha hizo kwanza kishaendelea na sura.

---

## 🚀 Anza Haraka

```bash
# Kagua usakinishaji
azd version

# Thibitisha kwa ajili ya AZD
# Hiari: az login ikiwa unakusudia kuendesha amri za Azure CLI moja kwa moja
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
azd up                   # Inapeleka kwenye Azure
azd show                 # Inaonyesha URL ya programu inayokimbia
azd down --force --purge # Inasafisha rasilimali
```

---

## 🔗 Uelekezaji

| Mwelekeo | Sura |
|-----------|---------|
| **Ifuatayo** | [Sura 2: Maendeleo Yanayolenga AI](../chapter-02-ai-development/README.md) |
| **Ruka hadi** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Karatasi ya Mbinu za Amri](../../resources/cheat-sheet.md)
- [Maswali Yanayoulizwa Mara kwa Mara (FAQ)](../../resources/faq.md)
- [Kamusi](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->