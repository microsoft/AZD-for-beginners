# Sura 1: Msingi & Anza Haraka

**📚 Kozi**: [AZD For Beginners](../../README.md) | **⏱️ Muda**: 30-45 dakika | **⭐ Ugumu**: Msingi

---

## Muhtasari

Sura hii inatambulisha msingi wa Azure Developer CLI (azd). Utajifunza dhana za msingi, kusakinisha zana, na kuweka programu yako ya kwanza kwenye Azure.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa umeweza:
- Elewa Azure Developer CLI ni nini na inavyotofautiana na Azure CLI
- Sakinisha na usanidi AZD kwenye jukwaa lako
- Weka programu yako ya kwanza kwenye Azure kwa kutumia `azd up`
- Safisha rasilimali kwa kutumia `azd down`

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Misingi ya AZD](azd-basics.md) | Dhana za msingi, istilahi, na muundo wa mradi | 15 dakika |
| 2 | [Usakinishaji & Usanidi](installation.md) | Mwongozo wa usakinishaji kwa jukwaa maalum | 10 dakika |
| 3 | [Mradi Wako wa Kwanza](first-project.md) | Vitendo: Weka programu ya wavuti kwenye Azure | 20 dakika |

---

## 🚀 Anza Haraka

```bash
# Angalia usakinishaji
azd version

# Ingia kwenye Azure
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
azd version              # Inaonyesha toleo lililowekwa
azd init --template todo-nodejs-mongo  # Inaanzisha mradi
azd up                   # Inasambaza kwenye Azure
azd show                 # Inaonyesha URL ya programu inayokimbia
azd down --force --purge # Inasafisha rasilimali
```

---

## 🔗 Uvinjari

| Mwelekeo | Sura |
|-----------|---------|
| **Ifuatayo** | [Sura 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/README.md) |
| **Ruka kwenda** | [Sura 3: Mipangilio](../chapter-03-configuration/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Muhtasari wa Amri](../../resources/cheat-sheet.md)
- [Maswali Yanayoulizwa Mara kwa Mara (FAQ)](../../resources/faq.md)
- [Kamusi](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Tamko la kutokuwa na dhamana:

Waraka huu umetafsiriwa kwa kutumia huduma ya tafsiri ya AI Co-op Translator (https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kufikia usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Waraka asili katika lugha yake ya awali unapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, inapendekezwa kutumia tafsiri ya mtaalamu wa kibinadamu. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zitokanazo na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->