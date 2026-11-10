# 6. fejezet: Előtelepítési tervezés és érvényesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 2-4 óra olvasás; további idő az átdolgozott laborokhoz | **⭐ Bonyolultság**: Középhaladó–Haladó

---

## Áttekintés

Ez a fejezet a telepítés előtti alapvető tervezési és érvényesítési lépéseket ismerteti. Tanulja meg elkerülni a költséges hibákat megfelelő kapacitástervezéssel, SKU-kiválasztással és előzetes ellenőrzésekkel.

> A parancsinstrukciókat az adott kiadott `azd 1.37.2` referencia alapján ellenőriztük. Felhőalapú telepítések nem történtek. A hosszabb leckék illusztratív töredékeket tartalmaznak, nem teljes helyi telepítési projekteket.

## Tanulási célok

A fejezet elvégzésével Ön képes lesz:
- Elvégezni az előzetes ellenőrzéseket a telepítés előtt
- Megtervezni a kapacitást és megbecsülni az erőforrásigényeket
- Megfelelő SKU-kat kiválasztani a költségoptimalizálás érdekében
- Beállítani az Application Insights-ot a megfigyeléshez
- Megérteni a több-ügynökös koordinációs mintákat és a telepítési követelményeiket

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Előzetes ellenőrzések](preflight-checks.md) | Konfiguráció érvényesítése telepítés előtt | 15 perc |
| 2 | [Kapacitástervezés](capacity-planning.md) | Erőforrásigények becslése | 20 perc |
| 3 | [SKU kiválasztás](sku-selection.md) | Megfelelő árazási szintek választása | 15 perc |
| 4 | [Application Insights](application-insights.md) | Megfigyelés konfigurálása | 20 perc |
| 5 | [Koordinációs minták](coordination-patterns.md) | Haladó több-ügynökös orchesztrációs tervezés | 60-75 perc |

---

## 🚀 Gyors kezdés

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Előtelepítési ellenőrzőlista

### Mielőtt `azd provision`

- [ ] Kvóta ellenőrizve a régióra
- [ ] SKU-k megfelelően kiválasztva
- [ ] Költségbecslés áttekintve
- [ ] Névkonvenció konzisztens
- [ ] Biztonság/RBAC konfigurálva

### Mielőtt `azd deploy`

- [ ] Környezeti változók beállítva
- [ ] Titkok a Key Vault-ban
- [ ] Kapcsolati karakterláncok ellenőrizve
- [ ] Egészségügyi ellenőrzések konfigurálva

---

## 💰 SKU-kiválasztási útmutató

| Terhelés | Fejlesztés | Üzemeltetés |
|----------|-------------|------------|
| Container Apps | Consumption | Consumption vagy dedikált terhelési profil a mért terhelés alapján |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI modellek | Támogatott pay-as-you-go telepítési típus | Pay-as-you-go vagy előre lefoglalt áteresztőképesség; modell/régió függő |
| AI Search | Ingyenes/Alap korlátokon belül | Alapszint vagy Standard szint az index, replikák és lekérdezési terhelés mérete szerint |

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [5. fejezet: Több-ügynök](../chapter-05-multi-agent/README.md) |
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