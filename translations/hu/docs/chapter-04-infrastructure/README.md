# 4. fejezet: Infrastruktúra mint kód és telepítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet az Infrastruktúra mint kód (IaC) mintákat tárgyalja Bicep sablonokkal, erőforrások létrehozásával és telepítési stratégiákkal az Azure Developer CLI használatával.

> Ellenőrizve a `azd 1.27.1` verzióval 2026 júliusában.

## Tanulási célok

A fejezet elvégzésével Ön:
- Megérti a Bicep sablon szerkezetét és szintaxisát
- Azure erőforrásokat hoz létre az `azd provision` segítségével
- Alkalmazásokat telepít az `azd deploy` használatával
- Kék-zöld és fokozatos telepítési stratégiákat valósít meg

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Erőforrások létrehozása](provisioning.md) | Azure erőforráskezelés az AZD-vel | 45 perc |
| 2 | [Telepítési útmutató](deployment-guide.md) | Alkalmazástelepítési stratégiák | 45 perc |
| 3 | [Saját sablon készítése](custom-templates.md) | Újrahasználható azd sablonok készítése és közzététele | 30 perc |

---

## 🚀 Gyors kezdés

```bash
# Inicializálás sablon alapján
azd init --template azure-functions-python-v2-http

# Előnézet, hogy mi lesz létrehozva
azd provision --preview

# Csak az infrastruktúra kiépítése
azd provision

# Csak a kód telepítése
azd deploy

# Vagy mindkettő egyszerre
azd up
```

---

## 📁 AZD projekt struktúra

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Alapvető parancsok

| Parancs | Leírás |
|---------|-------------|
| `azd init` | Projekt inicializálása |
| `azd provision` | Azure erőforrások létrehozása |
| `azd deploy` | Alkalmazáskód telepítése |
| `azd up` | létrehozás + telepítés |
| `azd down` | Minden erőforrás törlése |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Következő** | [5. fejezet: Több ügynökös megoldások](../chapter-05-multi-agent/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Container App példák](../../examples/container-app/README.md)
- [Adatbázis alkalmazás példa](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->