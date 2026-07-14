# 7. fejezet: Hibakeresés és Hibák Elhárítása

**📚 Tanfolyam**: [AZD Kezdőknek](../../README.md) | **⏱️ Időtartam**: 1-1,5 óra | **⭐ Nehézségi szint**: Középhaladó

---

## Áttekintés

Ez a fejezet segít diagnosztizálni és megoldani a gyakori problémákat az Azure Developer CLI használata közben. A telepítési hibáktól az AI specifikus gondokig.

> Ellenőrizve az `azd 1.27.1` verzióval 2026 júliusában.

## Tanulási célok

Ennek a fejezetnek az elvégzése után képes leszel:
- Diagnosztizálni a gyakori AZD telepítési hibákat
- Hibakeresni az autentikációs és jogosultsági problémákat
- Megoldani az AI szolgáltatások kapcsolódási gondjait
- Az Azure Portal és CLI használata hibakereséshez

---

## 📚 Tananyagok

| # | Tananyag | Leírás | Idő |
|---|--------|-------------|------|
| 1 | [Gyakori Problémák](common-issues.md) | Gyakran előforduló gondok | 30 perc |
| 2 | [Hibakeresési Útmutató](debugging.md) | Lépésről lépésre hibakeresési stratégiák | 45 perc |
| 3 | [AI Hibák Elhárítása](ai-troubleshooting.md) | AI-specifikus problémák | 30 perc |

---

## 🚨 Gyors Javítások

### Hitelesítési Problémák
```bash
# Szükséges az AZD munkafolyamatokhoz
azd auth login

# Opcionális, ha közvetlenül Azure CLI parancsokat is használsz
az login

azd auth status
```

### Telepítési Hibák
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Erőforrás Ütközések
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kvóta Túllépés
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Hibakód Referencia

| Hiba | Ok | Megoldás |
|-------|-------|----------|
| `AuthenticationError` | Nincs bejelentkezve | `azd auth login` |
| `ResourceNotFound` | Hiányzó erőforrás | Ellenőrizd az erőforrás neveket |
| `QuotaExceeded` | Előfizetési korlátok | Kérj kvóta növelést |
| `InvalidTemplate` | Bicep szintaxis hiba | `az bicep build` |
| `Conflict` | Az erőforrás már létezik | Használj új nevet vagy töröld |
| `Forbidden` | Nem elegendő jogosultság | Ellenőrizd az RBAC szerepköröket |

---

## 🔄 Visszaállítás és Helyreállítás

```bash
# Puha visszaállítás (források megtartása, kód újratelepítése)
azd deploy --force

# Kemény visszaállítás (minden törlése, újrakezdés)
azd down --force --purge
azd up
```

---

## 🔗 Navigáció

| Irány | Fejezet |
|-----------|---------|
| **Előző** | [6. fejezet: Telepítés előtti lépések](../chapter-06-pre-deployment/README.md) |
| **Következő** | [8. fejezet: Éles környezet](../chapter-08-production/README.md) |

---

## 📖 Kapcsolódó Források

- [Telepítés előtti ellenőrzések](../chapter-06-pre-deployment/preflight-checks.md)
- [Konfigurációs útmutató](../chapter-03-configuration/configuration.md)
- [AZD GitHub Kérdések](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->