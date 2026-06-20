# 6. fejezet: Telepítés előtti tervezés és érvényesítés

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 1 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet lefedi az alkalmazás telepítése előtti lényeges tervezési és érvényesítési lépéseket. Tanulja meg, hogyan kerülheti el a költséges hibákat megfelelő kapacitástervezéssel, SKU kiválasztással és előzetes ellenőrzésekkel.

> Érvényesítve az `azd 1.25.6` verzióval, 2026 júniusában.

## Tanulási célok

A fejezet elvégzésével Ön:
- Lefuttatja az előzetes ellenőrzéseket a telepítés előtt
- Tervezni tudja a kapacitást és becsülni az erőforrásigényeket
- Megfelelő SKUkat választ az optimális költségért
- Konfigurálja az Application Insights-ot a megfigyeléshez
- Megérti a csapat-összehangolási mintákat

---

## 📚 Tananyagok

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Előzetes ellenőrzések](preflight-checks.md) | A konfiguráció érvényesítése a telepítés előtt | 15 perc |
| 2 | [Kapacitástervezés](capacity-planning.md) | Erőforrásigények becslése | 20 perc |
| 3 | [SKU kiválasztás](sku-selection.md) | Megfelelő árképzési szintek választása | 15 perc |
| 4 | [Application Insights](application-insights.md) | Megfigyelés konfigurálása | 20 perc |
| 5 | [Összehangolási minták](coordination-patterns.md) | Csapat telepítési munkafolyamatai | 15 perc |

---

## 🚀 Gyors indulás

```bash
# Ellenőrizze az előfizetés kvótáit
az vm list-usage --location eastus --output table

# Telepítés előnézete (erőforrások nem jönnek létre)
azd provision --preview

# Bicep szintaxis érvényesítése
az bicep build --file infra/main.bicep

# Környezeti konfiguráció ellenőrzése
azd env get-values
```

---

## ☑️ Telepítés előtti ellenőrző lista

### Mielőtt `azd provision` parancsot futtatná

- [ ] Kvóta ellenőrizve a régióban
- [ ] SKUk megfelelően kiválasztva
- [ ] Költségbecslés átnézve
- [ ] Megnevezési konvenció egységes
- [ ] Biztonság/RBAC beállítva

### Mielőtt `azd deploy` parancsot futtatná

- [ ] Környezeti változók beállítva
- [ ] Titkok a Key Vault-ban
- [ ] Kapcsolati karakterláncok ellenőrizve
- [ ] Egészségügyi ellenőrzések konfigurálva

---

## 💰 SKU kiválasztási útmutató

| Munkaterhelés | Fejlesztés | Éles környezet |
|----------|-------------|------------|
| Konténeralkalmazások | Consumption | Dedikált D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry modellek | Standard | Standard + PTU |
| AI keresés | Alap | Standard S2+ |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [5. fejezet: Többügynök](../chapter-05-multi-agent/README.md) |
| **Következő** | [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kapcsolódó források

- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->