# 1. fejezet: Alapok és Gyors kezdés

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 30-45 perc | **⭐ Nehézségi szint**: Kezdő

---

## Áttekintés

Ez a fejezet bemutatja az Azure Developer CLI (azd) alapjait. Megismerheted az alapfogalmakat, telepítheted az eszközöket, és telepítheted az első alkalmazásodat az Azure-ba.

> Érvényesítve `azd 1.27.1` verzióval 2026 júliusában.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megérteni, mi az Azure Developer CLI, és miben különbözik az Azure CLI-től
- Telepíteni és konfigurálni az AZD-t a saját platformodon
- Az első alkalmazásodat telepíteni az Azure-ra a `azd up` paranccsal
- Erőforrásokat tisztítani a `azd down` paranccsal

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [AZD Alapok](azd-basics.md) | Alapfogalmak, terminológia és projektstruktúra | 15 perc |
| 2 | [Telepítés és Beállítás](installation.md) | Platform specifikus telepítési útmutatók | 10 perc |
| 3 | [Az első projekted](first-project.md) | Gyakorlati útmutató: Webalkalmazás telepítése az Azure-ra | 20 perc |
| 4 | [Használd a saját alkalmazásodat](bring-your-own-app.md) | Az azd hozzáadása már meglévő projekthez | 15 perc |
| 5 | [Dev konténerek és Codespaces](dev-containers.md) | Reprodukálható azd környezetek dev konténerekkel | 15 perc |

---

## ✅ Kezdj itt: Ellenőrizd a beállításokat

Mielőtt elkezdenéd, győződj meg róla, hogy a helyi géped készen áll az 1. fejezet sablonjára:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha a script hiányzó eszközökről számol be, először azokat javítsd, majd folytasd a fejezettel.

---

## 🚀 Gyors kezdés

```bash
# Telepítés ellenőrzése
azd version

# Hitelesítés az AZD-hez
# Opcionális: az login, ha közvetlenül az Azure CLI parancsokat szeretné futtatni
azd auth login

# Az első alkalmazás telepítése
azd init --template todo-nodejs-mongo
azd up

# Takarítsa el a befejezés után
azd down --force --purge
```

---

## ✅ Siker kritériumok

A fejezet elvégzése után képes leszel:

```bash
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                   # Telepít Azure-ra
azd show                 # Megjeleníti a futó alkalmazás URL-jét
azd down --force --purge # Erőforrások takarítása
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Következő** | [2. fejezet: AI-vezérelt fejlesztés](../chapter-02-ai-development/README.md) |
| **Ugrás ide** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |

---

## 📖 Kapcsolódó források

- [Parancs összefoglaló](../../resources/cheat-sheet.md)
- [Gyakran Ismételt Kérdések](../../resources/faq.md)
- [Szószedet](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->