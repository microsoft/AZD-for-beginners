# 1. fejezet: Alapok és Gyors Kezdés

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 30-45 perc | **⭐ Nehézség**: Kezdő

---

## Áttekintés

Ez a fejezet bevezeti az Azure Developer CLI (azd) alapjait. Megismered az alapfogalmakat, telepíted az eszközöket, és bevezeted az első alkalmazásodat az Azure-ba.

> Ellenőrizve az `azd 1.23.12` verzióval 2026 márciusában.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megérteni, mi az Azure Developer CLI, és miből különbözik az Azure CLI-től
- Telepíteni és konfigurálni az AZD-t a saját platformodon
- Elindítani az első alkalmazásodat az Azure-on az `azd up` parancs segítségével
- Takarítani az erőforrásokat az `azd down` parancs segítségével

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [AZD Alapok](azd-basics.md) | Alapfogalmak, terminológia és projektstruktúra | 15 perc |
| 2 | [Telepítés és Beállítás](installation.md) | Platform specifikus telepítési útmutatók | 10 perc |
| 3 | [Az Első Projektem](first-project.md) | Gyakorlati: Webalkalmazás telepítése Azure-ra | 20 perc |

---

## ✅ Itt Kezd: Ellenőrizd a Beállításodat

Mielőtt elkezdenéd, győződj meg róla, hogy a helyi géped készen áll az 1. fejezet sablonjára:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ha a szkript hiányzó eszközöket jelez, először azokat oldd meg, majd folytasd a fejezettel.

---

## 🚀 Gyors Kezdés

```bash
# Telepítés ellenőrzése
azd version

# Hitelesítés AZD-hez
# Opcionális: az login, ha közvetlenül az Azure CLI parancsokat szeretnéd futtatni
azd auth login

# Telepítsd az első alkalmazásodat
azd init --template todo-nodejs-mongo
azd up

# Takarítsd el, ha végeztél
azd down --force --purge
```

---

## ✅ Sikerkritériumok

A fejezet befejezése után képes leszel:

```bash
azd version              # Megjeleníti a telepített verziót
azd init --template todo-nodejs-mongo  # Inicializálja a projektet
azd up                   # Telepítés Azure-ba
azd show                 # Megjeleníti a futó alkalmazás URL-jét
azd down --force --purge # Erőforrások takarítása
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Következő** | [2. fejezet: AI-első Fejlesztés](../chapter-02-ai-development/README.md) |
| **Ugrás ide** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |

---

## 📖 Kapcsolódó Források

- [Parancsok Gyorsreferencia](../../resources/cheat-sheet.md)
- [GYIK](../../resources/faq.md)
- [Fogalomtár](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Nyilatkozat**:
Ez a dokumentum az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatizált fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Kritikus információk esetén professzionális emberi fordítást javaslunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->