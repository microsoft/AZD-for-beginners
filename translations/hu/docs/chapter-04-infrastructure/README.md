# 4. fejezet: Infrastruktúra mint kód és telepítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1–1,5 óra | **⭐ Nehézség**: Középhaladó

---

## Áttekintés

Ez a fejezet az Infrastruktúra mint kód (IaC) mintákat tárgyalja Bicep sablonokkal, erőforrások előállításával és telepítési stratégiákkal az Azure Developer CLI használatával.

## Tanulási célok

A fejezet elvégzése után:
- Megérti a Bicep sablon szerkezetét és szintaxisát
- Azure-erőforrásokat hoz létre `azd provision` segítségével
- Alkalmazásokat telepít `azd deploy` segítségével
- Megvalósít blue-green és rolling telepítési stratégiákat

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Erőforrások biztosítása](provisioning.md) | Azure erőforrás-kezelés AZD-vel | 45 perc |
| 2 | [Telepítési útmutató](deployment-guide.md) | Alkalmazás telepítési stratégiák | 45 perc |

---

## 🚀 Gyors indítás

```bash
# Inicializálás sablonból
azd init --template azure-functions-python-v2-http

# Előnézet arról, mi lesz létrehozva
azd provision --preview

# Csak az infrastruktúra biztosítása
azd provision

# Csak a kód telepítése
azd deploy

# Vagy mindkettő egyszerre
azd up
```

---

## 📁 AZD projekt felépítése

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
| `azd provision` | Azure-erőforrások létrehozása |
| `azd deploy` | Alkalmazáskód telepítése |
| `azd up` | erőforrások létrehozása + telepítés |
| `azd down` | Minden erőforrás törlése |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Következő** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

---

## 📖 Kapcsolódó források

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Konténeres alkalmazás példák](../../examples/container-app/README.md)
- [Adatbázis-alkalmazás példa](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot a [Co-op Translator](https://github.com/Azure/co-op-translator) mesterséges intelligencia alapú fordító szolgáltatásával fordítottuk. Bár mindent megteszünk a pontosságért, kérjük, vegye figyelembe, hogy az automatizált fordítások hibákat vagy pontatlanságokat tartalmazhatnak. A dokumentum eredeti nyelvű változatát kell tekinteni a hiteles forrásnak. Kritikus jelentőségű információk esetén professzionális, emberi fordítást javaslunk. A fordítás használatából eredő bármely félreértésért vagy téves értelmezésért nem vállalunk felelősséget.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->