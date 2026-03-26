# 6. fejezet: Előtelepítési tervezés és érvényesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet alapvető tervezési és érvényesítési lépéseket tárgyal az alkalmazás telepítése előtt. Tanulja meg, hogyan kerülheti el a költséges hibákat megfelelő kapacitástervezéssel, SKU kiválasztással és előzetes ellenőrzésekkel.

## Tanulási célok

A fejezet elvégzésével Ön képes lesz:
- Elvégezni telepítés előtti ellenőrzéseket
- Tervezni a kapacitást és becsülni az erőforrásigényeket
- Megfelelő SKU-kat választani a költséghatékonyság érdekében
- Konfigurálni az Application Insights-et a megfigyeléshez
- Megérteni a csapat együttműködési mintáit

---

## 📚 Tananyagok

| # | Tananyag | Leírás | Idő |
|---|----------|--------|-----|
| 1 | [Előzetes ellenőrzések](preflight-checks.md) | Konfiguráció érvényesítése telepítés előtt | 15 perc |
| 2 | [Kapacitástervezés](capacity-planning.md) | Erőforrásigények becslése | 20 perc |
| 3 | [SKU kiválasztás](sku-selection.md) | Megfelelő árképzési szintek kiválasztása | 15 perc |
| 4 | [Application Insights](application-insights.md) | Monitorozás konfigurálása | 20 perc |
| 5 | [Koordinációs minták](coordination-patterns.md) | Csapat telepítési munkafolyamatai | 15 perc |

---

## 🚀 Gyorsindítás

```bash
# Ellenőrizze az előfizetési kvótákat
az vm list-usage --location eastus --output table

# Telepítés előnézete (nem hoz létre erőforrásokat)
azd provision --preview

# Bicep szintaxis ellenőrzése
az bicep build --file infra/main.bicep

# Környezet konfigurációjának ellenőrzése
azd env get-values
```

---

## ☑️ Előtelepítési ellenőrzőlista

### Az `azd provision` előtt

- [ ] Kvóta ellenőrizve a régióban
- [ ] SKU-k megfelelően kiválasztva
- [ ] Költségbecslés átnézve
- [ ] Névkonvenció egységes
- [ ] Biztonság/RBAC beállítva

### Az `azd deploy` előtt

- [ ] Környezeti változók beállítva
- [ ] Titkok a Key Vaultban
- [ ] Kapcsolati karakterláncok ellenőrizve
- [ ] Egészségügyi ellenőrzések konfigurálva

---

## 💰 SKU kiválasztási útmutató

| Munkaterhelés | Fejlesztés | Termelés |
|---------------|------------|----------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-------|---------|
| **Előző** | [5. fejezet: Több ügynök](../chapter-05-multi-agent/README.md) |
| **Következő** | [7. fejezet: Hibakeresés](../chapter-07-troubleshooting/README.md) |

---

## 📖 Kapcsolódó források

- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [Telepítési útmutató](../chapter-04-infrastructure/deployment-guide.md)
- [Gyakori problémák](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ezt a dokumentumot az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordító szolgáltatás segítségével fordítottuk le. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum anyanyelvén tekintendő a hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget az ebből a fordításból eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->