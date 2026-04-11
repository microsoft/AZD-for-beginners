# 4. fejezet: Infrastruktúra kód formájában és telepítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Nehézségi fok**: Középhaladó

---

## Áttekintés

Ez a fejezet az Infrastructure as Code (IaC) mintákat, Bicep sablonokat, erőforrás előállítást és telepítési stratégiákat tárgyalja az Azure Developer CLI használatával.

> Validálva az `azd 1.23.12` verzióval, 2026 márciusában.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Megérteni a Bicep sablon szerkezetét és szintaxisát
- Azure erőforrások előállítása `azd provision` segítségével
- Alkalmazások telepítése `azd deploy` használatával
- Kék-zöld és gördülő telepítési stratégiák megvalósítása

---

## 📚 Tananyagok

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Erőforrások előállítása](provisioning.md) | Azure erőforráskezelés AZD-vel | 45 perc |
| 2 | [Telepítési útmutató](deployment-guide.md) | Alkalmazástelepítési stratégiák | 45 perc |

---

## 🚀 Gyors kezdés

```bash
# Inicializálás sablonból
azd init --template azure-functions-python-v2-http

# Előnézet a létrehozandóról
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

## 🔧 Fontos parancsok

| Parancs | Leírás |
|---------|-------------|
| `azd init` | Projekt inicializálása |
| `azd provision` | Azure erőforrások létrehozása |
| `azd deploy` | Alkalmazáskód telepítése |
| `azd up` | erőforrás előállítása + telepítés |
| `azd down` | Minden erőforrás törlése |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Következő** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Konténer alkalmazás példák](../../examples/container-app/README.md)
- [Adatbázis alkalmazás példa](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével lett lefordítva. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvi változatát kell tekinteni a hiteles forrásnak. Kritikus információk esetén profi, emberi fordítást javasolt kérni. Nem vállalunk felelősséget az ebből eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->