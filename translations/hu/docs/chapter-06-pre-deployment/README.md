# 6. fejezet: Telepítés előtti tervezés és érvényesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet a telepítés előtt szükséges alapvető tervezési és érvényesítési lépéseket tárgyalja. Tanuld meg, hogyan kerüld el a költséges hibákat megfelelő kapacitástervezéssel, SKU kiválasztással és előzetes ellenőrzésekkel.

## Tanulási célok

A fejezet elvégzése után képes leszel:
- Előzetes ellenőrzések futtatása a telepítés előtt
- Kapacitás tervezése és erőforrásigények becslése
- Megfelelő SKU-k kiválasztása a költségoptimalizálás érdekében
- Application Insights konfigurálása a monitorozáshoz
- A csapatkoordinációs minták megértése

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Előzetes ellenőrzések](preflight-checks.md) | Konfiguráció érvényesítése telepítés előtt | 15 min |
| 2 | [Kapacitástervezés](capacity-planning.md) | Erőforrásigények becslése | 20 min |
| 3 | [SKU-k kiválasztása](sku-selection.md) | Megfelelő árazási szintek kiválasztása | 15 min |
| 4 | [Application Insights](application-insights.md) | Monitorozás konfigurálása | 20 min |
| 5 | [Koordinációs minták](coordination-patterns.md) | Csapat telepítési munkafolyamatai | 15 min |

---

## 🚀 Gyors indítás

```bash
# Előfizetés kvótáinak ellenőrzése
az vm list-usage --location eastus --output table

# Telepítés előnézete (nem hoz létre erőforrásokat)
azd provision --preview

# Bicep szintaxis ellenőrzése
az bicep build --file infra/main.bicep

# Környezeti konfiguráció ellenőrzése
azd env get-values
```

---

## ☑️ Telepítés előtti ellenőrzőlista

### Mielőtt `azd provision`

- [ ] Kvóta ellenőrizve a régióban
- [ ] SKU-k megfelelő kiválasztása
- [ ] Költségbecslés áttekintve
- [ ] Elnevezési konvenció egységes
- [ ] Biztonság/RBAC konfigurálva

### Mielőtt `azd deploy`

- [ ] Környezeti változók beállítva
- [ ] Titkok a Key Vaultban
- [ ] Kapcsolati karakterláncok ellenőrizve
- [ ] Egészségügyi ellenőrzések konfigurálva

---

## 💰 SKU kiválasztási útmutató

| Munkaterhelés | Fejlesztés | Éles |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Következő** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kapcsolódó források

- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizáró nyilatkozat:
Ez a dokumentum a Co-op Translator (https://github.com/Azure/co-op-translator) nevű mesterséges intelligencián alapuló fordítószolgáltatás segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti, anyanyelvi dokumentum tekintendő hiteles forrásnak. Kritikus fontosságú információk esetén professzionális, emberi fordítást javasolunk. Nem vállalunk felelősséget az ezen fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->