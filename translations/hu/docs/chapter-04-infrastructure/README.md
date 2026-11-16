# 4. fejezet: Infrastruktúra kódként és telepítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 2-3 óra olvasás; extra idő a telepítési gyakorlatokhoz | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet az Infrastruktúra kódként (IaC) mintákat tárgyalja Bicep sablonokkal, erőforrások előkészítésével és telepítési stratégiákkal az Azure Developer CLI használatával.

> Parancs- és konfiguráció-áttekintési cél: `azd 1.37.2` (2026 november). Élő Azure erőforrás-előkészítés áttekintéskor nem történt.

## Tanulási célok

Ennek a fejezetnek a végére:
- Megérted a Bicep sablon szerkezetét és szintaxisát
- Azure erőforrásokat készítesz elő `azd provision` segítségével
- Alkalmazásokat telepítesz `azd deploy` használatával
- Megvalósítasz kék-zöld és gördülő telepítési stratégiákat

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Erőforrások előkészítése](provisioning.md) | Azure erőforráskezelés az AZD-vel | 45 perc |
| 2 | [Telepítési útmutató](deployment-guide.md) | Alkalmazástelepítési stratégiák | 45 perc |
| 3 | [Saját sablon készítése](custom-templates.md) | Újrahasználható azd sablonok készítése és közzététele | 30 perc |

---

## 🚀 Gyors kezdés

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD projekt szerkezete

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
| `azd up` | előkészítés + telepítés |
| `azd down` | Összes erőforrás törlése |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [3. fejezet: Konfiguráció](../chapter-03-configuration/README.md) |
| **Következő** | [5. fejezet: Többügynökös megoldások](../chapter-05-multi-agent/README.md) |

---

## 📖 Kapcsolódó források

- [Előkészítés előtti ellenőrzések](../chapter-06-pre-deployment/README.md)
- [Konténeralkalmazás példák](../../examples/container-app/README.md)
- [Adatbázis alkalmazás példa](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->