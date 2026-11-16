# 1. fejezet: Alapok & Gyors kezdés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 75-120 perc az első telepítéssel együtt; további gyakorlatok hosszabbak | **⭐ Nehézségi szint**: Kezdő

---

## Áttekintés

Ez a fejezet bemutatja az Azure Developer CLI (azd) alapjait. Megtanulod az alapfogalmakat, telepíted az eszközöket és telepíted első alkalmazásodat az Azure-ra.

> Parancs- és konfigurációfelülvizsgálat célpont: `azd 1.37.2` (2026. november). Az élő Azure-provízió nem futott a felülvizsgálat során.

## Tanulási célok

A fejezet elvégzése után:
- Megérted, mi az Azure Developer CLI és miben különbözik az Azure CLI-től
- Telepíted és beállítod az AZD-t a platformodon
- Az első alkalmazásodat az Azure-ra telepíted az `azd up` segítségével
- Erőforrásokat törölsz az `azd down` használatával

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [AZD alapok](azd-basics.md) | Alapfogalmak, terminológia és projektstruktúra | 15 perc |
| 2 | [Telepítés & Beállítás](installation.md) | Platform specifikus telepítési útmutatók | 10 perc |
| 3 | [Az első projekted](first-project.md) | Gyakorlati feladat: Webalkalmazás telepítése Azure-ra | 20 perc |
| 4 | [Hoztam egy saját appot](bring-your-own-app.md) | Az azd hozzáadása egy már meglévő projekthez | 15 perc |
| 5 | [Fejlesztői konténerek & Codespaces](dev-containers.md) | Reprodukálható azd környezetek fejlesztői konténerekkel | 15 perc |

---

## ✅ Innen kezd: Rendszered ellenőrzése

Mielőtt elkezdenéd, győződj meg róla, hogy a helyi géped készen áll az 1. fejezet sablonjára:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha a szkript hiányzó eszközökről jelez, orvosold azokat először, majd folytasd a fejezettel.

---

## 🚀 Gyors kezdés

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

## ✅ Siker kritériumok

A fejezet elvégzése után képes leszel:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Következő** | [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/README.md) |
| **Ugorj** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |

---

## 📖 Kapcsolódó források

- [Parancs Gyorsútmutató](../../resources/cheat-sheet.md)
- [GYIK](../../resources/faq.md)
- [Fogalomtár](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->