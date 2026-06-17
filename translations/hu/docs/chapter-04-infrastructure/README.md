# 4. fejezet: Infrastrukturakód és telepítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet az Infrastrukturakód (IaC) mintáit tárgyalja Bicep sablonokkal, erőforrás-provízionálással és telepítési stratégiákkal az Azure Developer CLI segítségével.

> Érvényesítve az `azd 1.25.6` verzióval 2026 júniusában.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megérteni a Bicep sablonok szerkezetét és szintaxisát
- Azure erőforrásokat létrehozni `azd provision` segítségével
- Alkalmazásokat telepíteni `azd deploy` használatával
- Blue-green és rolláló telepítési stratégiákat alkalmazni

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Erőforrások létrehozása](provisioning.md) | Azure erőforrás-kezelés az AZD-vel | 45 perc |
| 2 | [Telepítési Útmutató](deployment-guide.md) | Alkalmazás telepítési stratégiák | 45 perc |
| 3 | [Saját sablon készítése](custom-templates.md) | Újrafelhasználható azd sablonok készítése és közzététele | 30 perc |

---

## 🚀 Gyors kezdés

```bash
# Inicializálás sablonból
azd init --template azure-functions-python-v2-http

# Előnézet, mi kerül létrehozásra
azd provision --preview

# Csak az infrastruktúra előkészítése
azd provision

# Csak a kód telepítése
azd deploy

# Vagy mindkettő egyszerre
azd up
```

---

## 📁 AZD projekt struktúrája

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
| `azd deploy` | Alkalmazás kód telepítése |
| `azd up` | erőforrás létrehozás + telepítés |
| `azd down` | Minden erőforrás törlése |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Következő** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

---

## 📖 Kapcsolódó források

- [Előtelepítési ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Konténer alkalmazás példák](../../examples/container-app/README.md)
- [Adatbázis alkalmazás példa](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->