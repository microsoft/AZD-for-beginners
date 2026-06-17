# 1. fejezet: Alapok és Gyors Kezdés

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 30-45 perc | **⭐ Nehézségi szint**: Kezdő

---

## Áttekintés

Ez a fejezet bevezeti az Azure Developer CLI (azd) alapjait. Megismered az alapfogalmakat, telepíted az eszközöket, és az első alkalmazásodat telepíted az Azure-ra.

> Validált a `azd 1.25.6` verzióval 2026 júniusában.

## Tanulási célok

A fejezet elvégzésével képes leszel:
- Megérteni, mi az Azure Developer CLI és hogyan különbözik az Azure CLI-től
- Telepíteni és konfigurálni az AZD-t a platformodon
- `azd up` parancsal telepíteni az első alkalmazásodat Azure-ra
- `azd down` paranccsal törölni az erőforrásokat

---

## 📚 Tananyagok

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [AZD Alapok](azd-basics.md) | Alapfogalmak, terminológia és projekt struktúra | 15 perc |
| 2 | [Telepítés és Beállítás](installation.md) | Platform specifikus telepítési útmutatók | 10 perc |
| 3 | [Az első projekted](first-project.md) | Gyakorlati: Webalkalmazás telepítése Azure-ra | 20 perc |
| 4 | [Használd a saját alkalmazásod](bring-your-own-app.md) | Az azd hozzáadása egy meglévő projekthez | 15 perc |
| 5 | [Fejlesztői konténerek és Codespaces](dev-containers.md) | Reprodukálható azd környezetek fejlesztői konténerek segítségével | 15 perc |

---

## ✅ Innen kezd: Ellenőrizd a beállítást

Mielőtt elkezdenéd, ellenőrizd, hogy a helyi géped készen áll az 1. fejezet sablonjára:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha a szkript hiányzó eszközöket jelez, először javítsd ki azokat, majd folytasd a fejezettel.

---

## 🚀 Gyors Kezdés

```bash
# Telepítés ellenőrzése
azd version

# Hitelesítés az AZD-hez
# Opcionális: az login, ha közvetlenül az Azure CLI parancsokat szeretné futtatni
azd auth login

# Az első alkalmazás telepítése
azd init --template todo-nodejs-mongo
azd up

# Takarítás a befejezés után
azd down --force --purge
```

---

## ✅ Siker kritériumok

A fejezet befejezése után képes leszel:

```bash
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                   # Telepítés Azure-ra
azd show                 # Megjeleníti a futó alkalmazás URL-jét
azd down --force --purge # Erőforrások törlése
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Következő** | [2. fejezet: Mesterséges Intelligencia Alapú Fejlesztés](../chapter-02-ai-development/README.md) |
| **Ugrás ide** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Parancs gyorssegéd](../../resources/cheat-sheet.md)
- [GYIK](../../resources/faq.md)
- [Glosszárium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->