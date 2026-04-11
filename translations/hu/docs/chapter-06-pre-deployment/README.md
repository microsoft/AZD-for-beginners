# 6. fejezet: Telepítés előtti tervezés és érvényesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet a fontos tervezési és érvényesítési lépéseket tárgyalja az alkalmazás telepítése előtt. Tanulja meg, hogyan kerülheti el a költséges hibákat megfelelő kapacitástervezéssel, SKU-k kiválasztásával és előzetes ellenőrzésekkel.

> Érvényesítve az `azd 1.23.12` verzióval 2026 márciusában.

## Tanulási célok

A fejezet elvégzése után képes lesz:
- Elvégezni az előzetes ellenőrzéseket a telepítés előtt
- Megtervezni a kapacitást és megbecsülni az erőforrás-szükségletet
- Megfelelő SKU-kat választani a költséghatékonyság érdekében
- Konfigurálni az Application Insights-ot a megfigyeléshez
- Megérteni a csapatkoordinációs mintákat

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Előzetes ellenőrzések](preflight-checks.md) | Konfiguráció érvényesítése telepítés előtt | 15 perc |
| 2 | [Kapacitástervezés](capacity-planning.md) | Erőforrásigények becslése | 20 perc |
| 3 | [SKU kiválasztás](sku-selection.md) | Megfelelő árképzési szintek választása | 15 perc |
| 4 | [Application Insights](application-insights.md) | Megfigyelés beállítása | 20 perc |
| 5 | [Koordinációs minták](coordination-patterns.md) | Csapatszervezési munkafolyamatok | 15 perc |

---

## 🚀 Gyorsindítás

```bash
# Előfizetési kvóták ellenőrzése
az vm list-usage --location eastus --output table

# Telepítés előnézete (erőforrások létrehozása nélkül)
azd provision --preview

# Bicep szintaxis érvényesítése
az bicep build --file infra/main.bicep

# Környezeti konfiguráció ellenőrzése
azd env get-values
```

---

## ☑️ Telepítés előtti ellenőrzőlista

### Az `azd provision` előtt

- [ ] Kvóta ellenőrzése régió szerint
- [ ] SKU-k megfelelő kiválasztása
- [ ] Költségbecslés felülvizsgálata
- [ ] Névkonvenció egységesítése
- [ ] Biztonság/RBAC beállítása

### Az `azd deploy` előtt

- [ ] Környezeti változók beállítása
- [ ] Titkok Key Vault-ban
- [ ] Kapcsolati stringek ellenőrzése
- [ ] Állapotellenőrzések konfigurálása

---

## 💰 SKU kiválasztási útmutató

| Munkaterhelés | Fejlesztés | Éles környezet |
|----------|-------------|------------|
| Container Apps | Fogyasztás | Dedikált D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry modellek | Standard | Standard + PTU |
| AI keresés | Alap | Standard S2+ |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [5. fejezet: Több ügynök](../chapter-05-multi-agent/README.md) |
| **Következő** | [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kapcsolódó anyagok

- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatásával készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítás hibákat vagy pontatlanságokat tartalmazhat. Az eredeti dokumentum anyanyelvű változata tekintendő hiteles forrásnak. Fontos információk esetén szakmai, emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy félreértelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->