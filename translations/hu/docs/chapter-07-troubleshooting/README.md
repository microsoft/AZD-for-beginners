# 7. fejezet: Hibakeresés és Hibaelhárítás

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Bonyolultság**: Középhaladó

---

## Áttekintés

Ez a fejezet segít diagnosztizálni és megoldani az Azure Developer CLI használata közben fellépő gyakori problémákat. A telepítési hibáktól az AI-specifikus gondokig.

> Érvényesítve `azd 1.25.6` verzióval 2026 júniusában.

## Tanulási célok

A fejezet teljesítésével képes leszel:
- Felismerni a gyakori AZD telepítési hibákat
- Hibakeresni hitelesítési és jogosultsági problémákat
- Megoldani az AI szolgáltatások kapcsolatának problémáit
- Az Azure Portal és CLI használata hibakereséshez

---

## 📚 Tanórák

| # | Tanóra | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Gyakori problémák](common-issues.md) | Gyakran előforduló problémák | 30 perc |
| 2 | [Hibakeresési útmutató](debugging.md) | Lépésről lépésre hibakeresési stratégiák | 45 perc |
| 3 | [AI hibakeresés](ai-troubleshooting.md) | AI-specifikus problémák | 30 perc |

---

## 🚨 Gyors megoldások

### Hitelesítési problémák
```bash
# Szükséges az AZD munkafolyamatokhoz
azd auth login

# Opcionális, ha közvetlenül is használsz Azure CLI parancsokat
az login

azd auth status
```

### Províziózási hibák
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

## 📋 Hibakód hivatkozás

| Hiba | Ok | Megoldás |
|-------|-------|----------|
| `AuthenticationError` | Nincs bejelentkezve | `azd auth login` |
| `ResourceNotFound` | Hiányzó erőforrás | Ellenőrizd az erőforrás nevét |
| `QuotaExceeded` | Előfizetési korlátok | Kérj kvóta bővítést |
| `InvalidTemplate` | Bicep szintaxis hiba | `az bicep build` |
| `Conflict` | Az erőforrás már létezik | Használj új nevet vagy töröld |
| `Forbidden` | Nem megfelelő jogosultság | Ellenőrizd az RBAC szerepeket |

---

## 🔄 Visszaállítás és helyreállítás

```bash
# Puha visszaállítás (erőforrások megtartása, kód újratelepítése)
azd deploy --force

# Kemény visszaállítás (mindent töröl, tiszta kezdés)
azd down --force --purge
azd up
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [6. fejezet: Telepítés előtti előkészületek](../chapter-06-pre-deployment/README.md) |
| **Következő** | [8. fejezet: Éles környezet](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó források

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [AZD GitHub hibák](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->