# Sura 1: Msingi & Anza Haraka

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 30-45 dakika | **⭐ Ugumu**: Beginner

---

## Muhtasari

Sura hii inaelezea misingi ya Azure Developer CLI (azd). Utajifunza dhana za msingi, kusakinisha zana, na kupeleka programu yako ya kwanza kwenye Azure.

> Imethibitishwa dhidi ya `azd 1.23.12` mwezi Machi 2026.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Elewa Azure Developer CLI ni nini na jinsi inavyotofautiana na Azure CLI
- Sakinisha na usanidi AZD kwenye jukwaa lako
- Peleka programu yako ya kwanza kwenye Azure kwa `azd up`
- Safisha rasilimali kwa `azd down`

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Misingi ya AZD](azd-basics.md) | Dhana za msingi, istilahi, na muundo wa mradi | 15 dakika |
| 2 | [Usakinishaji & Usanidi](installation.md) | Mwongozo wa usakinishaji kwa jukwaa maalum | 10 dakika |
| 3 | [Mradi Wako wa Kwanza](first-project.md) | Vitendo: Weka programu ya wavuti kwenye Azure | 20 dakika |

---

## ✅ Anza Hapa: Thibitisha Mipangilio Yako

Kabla ya kuanza, thibitisha kwamba mashine yako ya ndani iko tayari kwa kiolezo cha Sura 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Anza Haraka

```bash
# Angalia usakinishaji
azd version

# Thibitisha kwa AZD
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

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Ijayo** | [Sura 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/README.md) |
| **Ruka hadi** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Mwongozo wa Amri](../../resources/cheat-sheet.md)
- [Maswali Yanayoulizwa Mara kwa Mara (FAQ)](../../resources/faq.md)
- [Kamusi](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kutolea uwajibikaji**:
Hati hii imefasiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya mtaalamu wa binadamu. Hatuwajibiki kwa kutokuelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->