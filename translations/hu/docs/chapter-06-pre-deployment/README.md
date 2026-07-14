# 6. fejezet: Telepítés előtti tervezés és érvényesítés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1 óra | **⭐ Összetettség**: Középhaladó

---

## Áttekintés

Ez a fejezet a telepítés előtti alapvető tervezési és érvényesítési lépéseket tárgyalja. Tanulja meg, hogyan kerülheti el a költséges hibákat megfelelő kapacitástervezéssel, SKU kiválasztással és előzetes ellenőrzésekkel.

> Ellenőrizve `azd 1.27.1` verzióval 2026 júliusában.

## Tanulási célok

Ennek a fejezetnek a befejezésével Ön:
- Elvégzi az előzetes ellenőrzéseket telepítés előtt
- Megtervezi a kapacitást és becslést készít az erőforrásigényekről
- Megfelelő SKU-kat választ a költségoptimalizálás érdekében
- Beállítja az Application Insights-ot a monitorozáshoz
- Megérti a csapatkoordinációs mintákat

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Előzetes ellenőrzések](preflight-checks.md) | Konfiguráció ellenőrzése telepítés előtt | 15 perc |
| 2 | [Kapacitástervezés](capacity-planning.md) | Erőforrásigény becslése | 20 perc |
| 3 | [SKU választás](sku-selection.md) | Megfelelő árazási szintek kiválasztása | 15 perc |
| 4 | [Application Insights](application-insights.md) | Monitorozás konfigurálása | 20 perc |
| 5 | [Koordinációs minták](coordination-patterns.md) | Csapat telepítési munkafolyamatok | 15 perc |

---

## 🚀 Gyors indítás

```bash
# Ellenőrizze az előfizetési kvótákat
az vm list-usage --location eastus --output table

# Telepítés előnézete (nincs erőforrás létrehozva)
azd provision --preview

# Bicep szintaxis ellenőrzése
az bicep build --file infra/main.bicep

# Ellenőrizze a környezeti konfigurációt
azd env get-values
```

---

## ☑️ Telepítés előtti ellenőrzőlista

### Mielőtt `azd provision`-t futtatna

- [ ] Kvóta ellenőrizve a régióban
- [ ] SKU-k megfelelően kiválasztva
- [ ] Költségbecslés átnézve
- [ ] Névmegjelölés következetes
- [ ] Biztonság/RBAC beállítva

### Mielőtt `azd deploy`-t futtatna

- [ ] Környezeti változók beállítva
- [ ] Titkok a Key Vault-ban
- [ ] Kapcsolati karakterláncok ellenőrizve
- [ ] Állapotellenőrzések konfigurálva

---

## 💰 SKU választási útmutató

| Munkaterhelés | Fejlesztés | Termelés |
|----------|-------------|------------|
| Konténeralkalmazások | Fogyasztás | Dedikált D4 |
| Alkalmazásszolgáltatás | B1/B2 | P1v3+ |
| Microsoft Foundry modellek | Standard | Standard + PTU |
| AI Keresés | Alap | Standard S2+ |

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
- [Gyakori hibák](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->