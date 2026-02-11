# 7. fejezet: Hibaelhárítás és hibakeresés

**📚 Tanfolyam**: [AZD kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1.5 óra | **⭐ Bonyolultság**: Közepes

---

## Áttekintés

Ez a fejezet segít a gyakori problémák diagnosztizálásában és megoldásában az Azure Developer CLI használata során. A telepítési hibáktól az AI-specifikus problémákig.

## Tanulási célok

A fejezet elvégzése után:
- Gyakori AZD telepítési hibák diagnosztizálása
- Hitelesítési és jogosultsági problémák hibakeresése
- AI szolgáltatások kapcsolódási problémáinak megoldása
- Az Azure Portal és CLI használata hibakereséshez

---

## 📚 Leckék

| # | Lecke | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Gyakori problémák](common-issues.md) | Gyakran előforduló problémák | 30 perc |
| 2 | [Hibakeresési útmutató](debugging.md) | Lépésről lépésre hibakeresési stratégiák | 45 perc |
| 3 | [AI hibakeresés](ai-troubleshooting.md) | AI-specifikus problémák | 30 perc |

---

## 🚨 Gyors javítások

### Hitelesítési problémák
```bash
azd auth login
az login
azd auth whoami
```

### Létrehozási hibák
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Erőforrás-ütközések
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvóta túllépése
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Hiba kód referencia

| Hiba | Ok | Megoldás |
|-------|-------|----------|
| `AuthenticationError` | Nincs bejelentkezve | `azd auth login` |
| `ResourceNotFound` | Hiányzó erőforrás | Ellenőrizd az erőforrásneveket |
| `QuotaExceeded` | Előfizetési korlátok | Kérj kvótaemelést |
| `InvalidTemplate` | Bicep szintaxis hiba | `az bicep build` |
| `Conflict` | Az erőforrás létezik | Használj új nevet vagy töröld |
| `Forbidden` | Nincs elegendő jogosultság | Ellenőrizd az RBAC szerepeket |

---

## 🔄 Visszaállítás és helyreállítás

```bash
# Lágy visszaállítás (erőforrások megtartása, kód újratelepítése)
azd deploy --force

# Kemény visszaállítás (minden törlése, újrakezdés)
azd down --force --purge
azd up
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [6. fejezet: Előtelepítés](../chapter-06-pre-deployment/README.md) |
| **Következő** | [8. fejezet: Éles környezet](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [AZD GitHub hibajegyek](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Felelősségkizárás:
Ezt a dokumentumot a Co-op Translator (https://github.com/Azure/co-op-translator) nevű mesterséges intelligencia fordító szolgáltatással fordítottuk. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelven tekintendő irányadónak. Kritikus információk esetén professzionális, emberi fordítás igénybevételét javasoljuk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->