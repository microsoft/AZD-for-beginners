# Sura 1: Msingi & Mwanzo wa Haraka

**📚 Kozi**: [AZD Kwa Waanzilishi](../../README.md) | **⏱️ Muda**: Dakika 75-120 ikiwa ni pamoja na utoaji wa kwanza; mazoezi ya ziada huchukua muda mrefu zaidi | **⭐ Ugumu**: Mwanzo

---

## Muhtasari

Sura hii inatambulisha misingi ya Azure Developer CLI (azd). Utajifunza dhana za msingi, kusanidi zana, na kutoa programu yako ya kwanza kwenye Azure.

> Lengo la mapitio ya amri na usanidi: `azd 1.37.2` (Novemba 2026). Utoaji wa moja kwa moja wa Azure haukufanyika wakati wa mapitio.

## Malengo ya Kujifunza

Kwa kumaliza sura hii, utakuwa na uwezo wa:
- Kuelewa Azure Developer CLI ni nini na inatofautianaje na Azure CLI
- Kusakinisha na kusanidi AZD kwenye jukwaa lako
- Kutoa programu yako ya kwanza kwenye Azure kwa kutumia `azd up`
- Kusafisha rasilimali kwa kutumia `azd down`

---

## 📚 Masomo

| # | Somo | Maelezo | Muda |
|---|--------|-------------|------|
| 1 | [Misingi ya AZD](azd-basics.md) | Dhana za msingi, istilahi, na muundo wa mradi | Dakika 15 |
| 2 | [Usakinishaji & Usanidi](installation.md) | Mwongozo wa usakinishaji maalum kwa jukwaa | Dakika 10 |
| 3 | [Mradi Wako wa Kwanza](first-project.md) | Kwa vitendo: Toa programu ya wavuti kwenye Azure | Dakika 20 |
| 4 | [Leta Programu Yako](bring-your-own-app.md) | Ongeza azd kwenye mradi uliopo tayari | Dakika 15 |
| 5 | [Makonteina ya Maendeleo & Codespaces](dev-containers.md) | Mazingira ya azd yanayorejelewa na makonteina ya maendeleo | Dakika 15 |

---

## ✅ Anza Hapa: Thibitisha Usanidi Wako

Kabla ya kuanza, thibitisha kuwa kompyuta yako ya eneo la mbali iko tayari kwa kiolezo cha Sura 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ikiwa script inaripoti zana zinazokosekana, rekebisha hizo kwanza kisha endelea na sura.

---

## 🚀 Mwanzo wa Haraka

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Vigezo vya Mafanikio

Baada ya kumaliza sura hii, unapaswa kuwa na uwezo wa:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Urambazaji

| Mwelekeo | Sura |
|-----------|---------|
| **Ifuatayo** | [Sura 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/README.md) |
| **Ruka hadi** | [Sura 3: Usanidi](../chapter-03-configuration/README.md) |

---

## 📖 Rasilimali Zinazohusiana

- [Karatasi ya Amri](../../resources/cheat-sheet.md)
- [Maswali Yanayoulizwa Mara kwa Mara](../../resources/faq.md)
- [Kamusi](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->